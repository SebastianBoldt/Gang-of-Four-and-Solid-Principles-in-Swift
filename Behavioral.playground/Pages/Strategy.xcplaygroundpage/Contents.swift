//: [Previous](@previous)

import Foundation

protocol Responder {
    func speak(input: String) -> String
}

public struct Chatbot {
    
    var responder : Responder
    
    init(responder: Responder) {
        self.responder = responder
    }
    
    public func respond(inputString: String) -> String {
        return responder.speak(input: inputString)
    }
}

public struct EnglishSpeaker : Responder {
    func speak(input: String) -> String {
        return "You said:" + input
    }
}

public struct GermanSpeaker : Responder {
    func speak(input: String) -> String {
        return "Du hast gesagt:" + input
    }
}

let germanResponder = GermanSpeaker()
let englishResponder = EnglishSpeaker()

var mainBot = Chatbot(responder: germanResponder)
mainBot.respond(inputString: "Hello Bot")

mainBot.responder = englishResponder
mainBot.respond(inputString: "Hello Bot")

//: [Next](@next)
