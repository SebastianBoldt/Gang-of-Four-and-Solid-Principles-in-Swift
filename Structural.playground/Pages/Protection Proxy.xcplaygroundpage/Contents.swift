//: [Previous](@previous)

import Foundation

enum AuthError: Error {
    case unauthorized
}

class PasswordStore {
    func showSecretInformation() -> String {
        return "SecretPassword"
    }
}

class PasswordTresor {
    var resourceToProtect: PasswordStore?
    func authenticate(password: String) -> Bool {
        guard password == "password" else {
            return false
        }
        resourceToProtect = PasswordStore()
        return true
    }
    
    func showSecretInformation() throws -> String {
        guard let resourceToProtect = resourceToProtect else {
            throw AuthError.unauthorized
        }
        return resourceToProtect.showSecretInformation()
    }
}

//Usage

let tresor = PasswordTresor()
tresor.authenticate(password: "password")
try tresor.showSecretInformation()

//: [Next](@next)
