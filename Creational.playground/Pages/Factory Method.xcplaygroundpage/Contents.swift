//: [Previous](@previous)

import Foundation

protocol PizzaCreator {
    func getIngredients() -> [String]
}

struct HawaiCreator: PizzaCreator {
    func getIngredients() -> [String] {
        return ["Ham","Pineapple","Cheese","Tomato Sauce"]
    }
}

struct SalamiCreator: PizzaCreator {
    func getIngredients() -> [String] {
        return ["Salami","Cheese","Tomato Sauce"]
    }
}

enum PizzaType {
    case Salami
    case Hawai
}

func getPizzaIngredientsList(forType type: PizzaType) -> PizzaCreator {
    switch type {
        case .Hawai:
            return HawaiCreator()
        case .Salami:
            return SalamiCreator()
    }
}

func printIngredients(creator: PizzaCreator) {
    print(creator.getIngredients())
}

printIngredients(creator: getPizzaIngredientsList(forType: .Hawai))

//: [Next](@next)
