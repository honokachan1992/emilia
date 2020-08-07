import Sword
import Foundation

func generateWaifu(characterName: String) -> String {
    let url = "https://danbooru.donmai.us/posts.json?random=true&tags=\(characterName)&rating=safe&limit=1"
    var res:String = String()
    if let url = URL(string: url) {
                if let data = try? Data(contentsOf: url) {
                    let img: [Image] = try! JSONDecoder().decode([Image].self, from: data)
                    res = String(img.first?.url ?? "Didn't find anything.")
            }
        }
            return res
}

func parseMal(query: String) -> String{
    return "Work in progress."
}

let bot = Sword(token: "bot token")

bot.editStatus(to: "online", playing: "with you")
let prefix = "!"
bot.on(.messageCreate) { data in

    let message = data as! Message
    var waifuName:String = String()
    var waifu:String = String()
    if message.content.starts(with: prefix + "danbooru"){
        let messageContent = String(message.content)
        let messageArray = messageContent.split(separator: " ")
        if messageArray.count == 1 || messageArray.count > 2{
            message.reply(with:"Invalid parameters\nUsage: !danbooru your_tag\nExample:!danbooru makise_kurisu")
        }
        else{
            waifuName = String(messageArray[1])
            waifu = generateWaifu(characterName: waifuName)
            message.reply(with: waifu)
        }
    }
    else if message.content == prefix + "avatar"{
        message.reply(with: "idk")

    }
    else if message.content == prefix + "help"{
        message.reply(with: "It works just like it would if you were on danbooru directly\nexample usage: `!danbooru your_tag`")
    }
    
    
    
    
}

bot.connect()