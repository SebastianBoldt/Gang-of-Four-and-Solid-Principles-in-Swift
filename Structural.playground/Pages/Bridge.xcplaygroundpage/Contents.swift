//: [Previous](@previous)

import Foundation

protocol Device {
    func run()
}

class RemoteControl {
    var device: Device
    
    func turnOn() {
        self.device.run()
    }
    
    init(device: Device) {
        self.device = device
    }
}

class TV: Device {
    func run() {
        print("TV is running now")
    }
}

class Vacuum: Device {
    func run() {
        print("Vacuum is running now")
    }
}

let control = RemoteControl(device: Vacuum())
control.turnOn()


//: [Next](@next)
