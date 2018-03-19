//: Playground - noun: a place where people can play

import UIKit

// THERE SHOULD NEVER BE MORE THAN ONE REASON FOR A CLASS TO CHANGE.

struct Wrong {
    class APIHandler {
        func handle() {
            let data = requestDataFromAPI()
            let array = parse(data: data)
            saveToDB(array: array)
        }
        
        private func requestDataFromAPI() -> Data {
            // send API request and wait the response
            return Data()
        }
        
        private func parse(data: Data) -> [String] {
            // parse the data and create the array
            return []
        }
        
        private func saveToDB(array: [String]) {
            // save the array in a database (CoreData/Realm/...)
        }
    }
}

//TODO: We should use the Dependency Inversion here too ...

struct Right {
    class APIHandler {
        let requestHandler: RequestHandler
        let parseHandler: ParseHandler
        let dbHandler: DataBaseHandler
        
        init(requestHandler: RequestHandler, parseHandler: ParseHandler, dbHandler: DataBaseHandler) {
            self.requestHandler = requestHandler
            self.parseHandler = parseHandler
            self.dbHandler = dbHandler
        }
        
        func handle() {
            let data = requestHandler.requestDataFromAPI()
            let array = parseHandler.parse(data: data)
            dbHandler.saveToDB(array: array)
        }
    }
    
    class RequestHandler {
        func requestDataFromAPI() -> Data {
            // send API request and wait the response
            return Data()
        }
    }
    
    class ParseHandler {
        func parse(data: Data) -> [String] {
            // parse the data and create the array
            return []
        }
    }
    
    class DataBaseHandler {
        func saveToDB(array: [String]) {
            // save the array in a database (CoreData/Realm/...)
        }
    }
}

