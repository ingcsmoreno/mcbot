const mineflayer = require('mineflayer')

function getSession() {
    try {
        console.log(`[INFO] Starting bot as ${process.env.MC_USER}...`)

        return mineflayer.createBot({
          host: process.env.MC_HOST ,
          port: parseInt(process.env.MC_PORT),
          username: process.env.MC_USER,
          password: process.env.MC_PASS
          //host: "corcraft.orion.net.ar",
          //port: 25588,
          //username: 'Fallencito',
          //password: 'H2nebx9zzZVZ'
          //username: 'cuentanueva33xd@gmail.com',
          //password: '$Paprica66'
        })
    } catch (err) {
        console.log(error(err.message));
        process.exit(1)
    }
}

const bot = getSession()

console.log('[INFO] Bot session initialized.')

if ( process.env.MC_LOOK_NEAR === "true" ) {

  console.log("[INFO] Teaching bot to look at near players.")

  function lookNearPlayer () {
    const playerFilter = (entity) => entity.type === 'player'
    const playerEntity = bot.nearestEntity(playerFilter)

    if (!playerEntity) return

    const position = playerEntity.position.offset(0, playerEntity.height, 0)

    bot.lookAt(position)
    
  }

  bot.on('physicTick', lookNearPlayer) 
}

if ( process.env.MC_SAY_HI === "true" ) {
  console.log("[INFO] Teaching bot to say Hi.")
  
  bot.on('playerJoined', (player) => {
    if (player.username !== bot.username) {
      console.log(`[INFO] Player joined the server: ${player.username}`)
      bot.chat(`Hola ${player.username}!`)
      bot.whisper( player.username, 'Estoy AFK, hacé de cuenta que no estoy.')
    }
  })

  bot.on('whisper', (username, message, rawMessage) => {
    console.log(`[INFO] I received a message from ${username}: ${message}`)
    bot.whisper(username, 'No voy a responder a eso...')
    bot.whisper(username, 'Soy solo un simple BOT que sigue las 3 leyes de la robótica.')
  })
}

bot.on('kicked', (reason, loggedIn) => console.log("[ERRO] You got kicked because: %s", JSON.parse(reason)['text']))
bot.on('error', (err) => console.log(err))