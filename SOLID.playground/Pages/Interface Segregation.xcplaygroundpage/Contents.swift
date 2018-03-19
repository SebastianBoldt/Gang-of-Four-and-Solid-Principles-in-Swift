//: [Previous](@previous)

import Foundation

// Fat protocol - Problem

protocol FatProtocol {
    func tap()
    func doubleTap()
    func longTap()
}

struct ExtendedButton: FatProtocol {
    func tap() {
        
    }
    
    func doubleTap() {
        
    }
    
    func longTap() {
        
    }
}

struct SimpleButton: FatProtocol {
    func tap() {
        // The SimpleButton just needs to implement this function
        // All the other functions are irrelavant
    }
    
    func doubleTap() {
    }
    
    func longTap() {
    }
}


// Fat protocol - Solution

protocol Tappable {
    func tap()
}

protocol DoubleTappable {
    func doubleTap()
}

protocol LongTappable {
    func longTap()
}


struct AnotherSimpleButton: Tappable {
    func tap() {
        // Now we just need to implement the methods we really need.
    }
}

// Fat class - Problem

struct Video {
    var title: String
    var description: String
    var data: Data
    var metaData: String
    var fileType: String
}

// The log functions just needs title and description.
func log(video: Video) {
    print("\(video.title), \(video.description)")
}

// Fat class - Solution

protocol Loggable {
    var title: String { get }
    var description: String { get }
}

struct BetterVideo: Loggable {
    var title: String
    var description: String
    var data: Data
    var metaData: String
    var fileType: String
}

// The log functions just needs title and description.
func betterLog(loggable: Loggable) {
    print("\(loggable.title), \(loggable.description)")
}

//: [Next](@next)
