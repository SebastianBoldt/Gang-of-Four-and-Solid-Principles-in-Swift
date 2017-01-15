//: [Previous](@previous)

/*:
 ## Command Pattern
 
 Wrapping functions into object with generalized interface
*/

import Foundation

protocol DoorCommand {
    func execute() -> String
}

class OpenCommand : DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Openend \(doors)"
    }
}

class CloseCommand : DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Closed \(doors)"
    }
}

class DoorOperations {
    let openCommand: DoorCommand
    let closeCommand: DoorCommand
    
    init(doors: String) {
        self.openCommand = OpenCommand(doors: doors)
        self.closeCommand = CloseCommand(doors: doors)
    }
    
    func close() -> String {
        return closeCommand.execute()
    }
    
    func open() -> String {
        return openCommand.execute()
    }
}


let podBayDoors = "Pod Bay Doors"
let doorModule = DoorOperations(doors: podBayDoors)
doorModule.open()
doorModule.close()
//: [Next](@next)
