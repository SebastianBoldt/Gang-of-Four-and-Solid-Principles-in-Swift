//: [Previous](@previous)

import Foundation

enum Skill {
    case Junior
    case Senior
}

protocol Developer {
    var skill: Skill { get }
    func code() -> String
    static func make(skill: Skill) -> Developer
}

typealias DeveloperFactory = (Skill) -> Developer

struct FrontEndDeveloper: Developer {
    var skill: Skill
    
    func code() -> String {
        return "<body> Hello World </body>"
    }
    
    static func make(skill: Skill) -> Developer {
        return FrontEndDeveloper(skill: skill)
    }
}

struct BackendDeveloper: Developer {
    var skill: Skill
    
    func code() -> String {
        return "SELECT * FROM DEVELOPERS"
    }
    
    static func make(skill: Skill) -> Developer {
        return BackendDeveloper(skill: skill)
    }
}

// Abstract Factory

enum DeveloperType {
    case backend
    case frontend
}

struct AbstractDeveloperFactory {
    static func factory(for type: DeveloperType) -> DeveloperFactory {
        switch type {
            case .backend:
                return BackendDeveloper.make
            case .frontend:
                return FrontEndDeveloper.make
        }
    }
}


// Usage

let frontEndFactory = AbstractDeveloperFactory.factory(for: .frontend)
let frontEndDev = frontEndFactory(.Junior)
frontEndDev.code()

//: [Next](@next)
