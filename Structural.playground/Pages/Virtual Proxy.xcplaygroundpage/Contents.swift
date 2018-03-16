//: [Previous](@previous)

import Foundation

protocol Server {
    func compute() -> String
}

struct ExpensiveServer: Server {
    func compute() -> String {
        return "Computation completed"
    }
}

class ExpensiveServerInterface: Server {
    lazy private var expensiveServer = ExpensiveServer()
    
    func compute() -> String {
        return expensiveServer.compute()
    }
}

let serverInterface = ExpensiveServerInterface()
serverInterface.compute()

//: [Next](@next)
