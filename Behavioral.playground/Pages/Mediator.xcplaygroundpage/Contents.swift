//: [Previous](@previous)

import Foundation

protocol Sender {
    func send(message: String)
}

protocol Receiver {
    func receive(message: String)
}

struct Subscriber : Receiver {
    var name : String
    func receive(message: String) {
        print("\(self.name) received message: \(message)")
    }

}

class Broadcaster : Sender {
    
    private var receivers: [Receiver] = []
    
    public func addReceiver(receiver: Receiver) {
        receivers.append(receiver)
    }
    
    public func send(message: String) {
        for rec in receivers {
            rec.receive(message:message)
        }
    }
}

func broadCast(message:String, broadCaster: Broadcaster) {
    broadCaster.send(message: message)
}

let broadCaster = Broadcaster()

broadCaster.addReceiver(receiver: Subscriber(name: "Peter"))
broadCaster.addReceiver(receiver:Subscriber(name: "Hans"))
broadCaster.addReceiver(receiver:Subscriber(name: "Sabine"))


broadCast(message: "Secret Message", broadCaster: broadCaster)




//: [Next](@next)
