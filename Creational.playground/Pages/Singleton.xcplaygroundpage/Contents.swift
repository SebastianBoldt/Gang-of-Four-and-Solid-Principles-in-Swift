//: [Previous](@previous)

import Foundation

struct JustOnce {
    public static let internalInstance : JustOnce = JustOnce()
    private init() {}
}

//: [Next](@next)
