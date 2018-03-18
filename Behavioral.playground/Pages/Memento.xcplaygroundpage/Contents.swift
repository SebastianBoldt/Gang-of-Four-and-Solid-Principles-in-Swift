//: [Previous](@previous)

import Foundation

typealias Memento = NSDictionary

protocol MementoConvertible {
    init?(memento: Memento)
    var memento: Memento { get }
}

struct Student: MementoConvertible {
    var memento: Memento {
        return ["name" : self.name, "age" : self.age]
    }
    
    private var name: String
    private var age: Int
    
    init?(memento: Memento) {
        guard let name = memento.object(forKey: "name") as? String else {
            return nil
        }
        
        guard let age = memento.object(forKey: "age") as? Int else {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

struct Store {
    func store(name: String, memento: Memento) {
        let defaults = UserDefaults.standard
        defaults.set(memento, forKey: name)
        defaults.synchronize()
    }
    
    func retrieveStudent(name: String) -> Memento? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: name) as? Memento
    }
}

//: [Next](@next)
