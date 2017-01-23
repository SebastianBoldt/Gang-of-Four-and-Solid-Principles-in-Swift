//: [Previous](@previous)

import Foundation

protocol Pizza {
    func getIngredients() -> [String]
    func printIngredients()
}

extension Pizza {
    func printIngredients() {
        for (index,value) in self.getIngredients().enumerated() {
            print("Ingredient(\(index+1)):\(value)")
        }
    }
}

class BasicPizza : Pizza {
    func getIngredients() -> [String] {
        return ["Dough","Tomato-Sauce","Cheese"]
    }
}

final class HawaiDecorator : Pizza {

    private var decoratedPizza : Pizza
    
    required init (decoratedPizza: Pizza) {
        self.decoratedPizza = decoratedPizza
    }
    
    func getIngredients() -> [String] {
        return self.decoratedPizza.getIngredients() + ["Boild Ham","Pineapple"]
    }
}

final class CheeseWheelDecorator : Pizza {
    private var decoratedPizza : Pizza
    
    required init (decoratedPizza: Pizza) {
        self.decoratedPizza = decoratedPizza
    }
    
    func getIngredients() -> [String] {
        return self.decoratedPizza.getIngredients() + ["More Cheese for the surrounding"]
    }
}


let basicPizza = BasicPizza()
let hawaiPizza = HawaiDecorator(decoratedPizza: basicPizza)
let hawaiWithCheeseWheel = CheeseWheelDecorator(decoratedPizza: hawaiPizza)

hawaiWithCheeseWheel.printIngredients()





//: [Next](@next)
