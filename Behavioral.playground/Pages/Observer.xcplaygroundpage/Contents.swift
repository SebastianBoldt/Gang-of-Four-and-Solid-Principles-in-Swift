//: [Previous](@previous)

import Foundation

protocol Observer : class {
    func willChange(propertyName: String, newPropertyValue: Any?)
    func didChange(propertyName: String, oldPropertyValue: Any?)
}

final class Observable {
    
    weak var observer: Observer?
    private let observablePropertyName = "observableProperty"
    
    var observableProperty: Int = 0 {
        willSet(newValue) {
            observer?.willChange(propertyName: observablePropertyName, newPropertyValue: newValue)
        }
        didSet {
            observer?.didChange(propertyName: observablePropertyName, oldPropertyValue: oldValue)
        }
    }
}

final class Spy : Observer {
    func willChange(propertyName: String, newPropertyValue: Any?) {
       print("will change to value \(newPropertyValue)")
    }
    
    func didChange(propertyName: String, oldPropertyValue: Any?) {
        print("changed from oldValue \(oldPropertyValue)")
    }
}

let observable = Observable()
let observer = Spy()
observable.observer = observer

observable.observableProperty = 200

//: [Next](@next)
