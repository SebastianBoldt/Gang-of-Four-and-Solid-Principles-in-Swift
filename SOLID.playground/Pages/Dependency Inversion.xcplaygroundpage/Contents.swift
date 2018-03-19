//: [Previous](@previous)

import Foundation

// The Problem - Tightly coupled classes

struct Wrong {
    struct Datastore {
        // The Datastore should not know something about the Filehandler, it should use an abstraction instead
        let fileHandler: FileHandler = FileHandler()
    }
    
    struct FileHandler {
        func getFile(name: String) -> Data {
            return Data()
        }
        
        func storeFile(name: String, data: Data) {
            // Stores the File
        }
    }
}


// The Solution - Protocols and DI through the initalizer

protocol FileHandlerProtocol {
    func getFile(name: String) -> Data
    func storeFile(name: String, data: Data)
}

struct Right {
    struct Datastore {
        let fileHandler: FileHandlerProtocol
        
        init(fileHandler: FileHandlerProtocol) {
            self.fileHandler = fileHandler
        }
    }
    
    struct FileHandler: FileHandlerProtocol {
        func getFile(name: String) -> Data {
            return Data()
        }
        func storeFile(name: String, data: Data) {
            // Store the File
        }
    }
}


//: [Next](@next)
