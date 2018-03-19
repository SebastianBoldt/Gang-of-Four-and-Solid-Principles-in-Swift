//: [Previous](@previous)

import Foundation

// SOFTWARE ENTITIES (CLASSES, MODULES, FUNCTIONS, ETC.) SHOULD BE OPEN FOR EXTENSION, BUT CLOSED FOR MODIFICATION.

protocol Printable {
    func printElement()
}

public struct Printer {
    func print(printables: [Printable]) {
        for printable in printables {
            printable.printElement()
        }
    }
}

struct Student: Printable {
    var name: String
    
    func printElement() {
        print("student \(name)")
    }
}

struct Teacher: Printable {
    var name: String
    func printElement() {
        print("teacher: \(name)")
    }
}


let printables: [Printable] = [Student(name: "Peter"), Teacher(name: "James")]
Printer().print(printables: printables)

//: [Next](@next)
