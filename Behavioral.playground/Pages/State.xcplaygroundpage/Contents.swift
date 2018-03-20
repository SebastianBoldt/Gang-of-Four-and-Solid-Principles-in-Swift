//: [Previous](@previous)

import Foundation

protocol State {
    var isAuthorized: Bool { get }
}

final class UserContext {
    private var userId: String
    private var state: State = UnauthorizedState()
    
    init(userId: String) {
        self.userId = userId
    }
    
    var isAuthorized: Bool {
        self.state.isAuthorized
    }
    public func changeToAuthorizedState() {
        self.state = AuthorizedState()
    }
    
    public func changeToUnauthorizedState() {
        self.state = UnauthorizedState()
    }
}

struct AuthorizedState: State {
    var isAuthorized: Bool {
        return true
    }
}

struct UnauthorizedState: State {
    var isAuthorized: Bool {
        return false
    }
}

var context = UserContext(userID: UUID().uuidString)
context.changeToAuthorizedState()
context.isAuthorized

//: [Next](@next)
