//: [Previous](@previous)

import Foundation

protocol Country {
    func accept(visitor: Visitor)
}

protocol Visitor {
    var age: Int { get }
    func visit(country: Country)
}

class Germany: Country {
    func accept(visitor: Visitor) {
        if visitor.age >= 18 {
            visitor.visit(country: self)
        }
    }
}

class USA: Country {
    func accept(visitor: Visitor) {
        if visitor.age >= 18 {
            visitor.visit(country: self)
        }
    }
}

class Peter: Visitor {
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
    var visitedCountries: [Country] = []
    func visit(country: Country) {
        visitedCountries.append(country)
    }
}

let usa = USA()
let germany = Germany()

let peter = Peter(age: 19)

germany.accept(visitor: peter)

print(peter.visitedCountries.last!)
