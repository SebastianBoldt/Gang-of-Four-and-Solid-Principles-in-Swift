//: [Previous](@previous)

import Foundation

struct ComplexToConstruct {
    public var complexToCompute : Int = {
        print("Constructed just once")
        var sum = 0
        for i in 0...100 {
            sum = sum + i
        }
        
        return sum
    }()
    
    
    public func clone() -> ComplexToConstruct {
        return ComplexToConstruct(complexToCompute: self.complexToCompute)
    }
}

let complex = ComplexToConstruct()
complex.complexToCompute
complex.clone().complexToCompute
//: [Next](@next)
