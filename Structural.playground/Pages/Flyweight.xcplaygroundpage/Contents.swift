//: [Previous](@previous)

import Foundation

protocol Soldier {
    func render(from location: CGPoint, to newLocation: CGPoint)
}

class Infantry: Soldier {
    private let modelData: Data
    
    init(modelData: Data) {
        self.modelData = modelData
    }
    
    func render(from location: CGPoint, to newLocation: CGPoint) {
        // Remove rendering from original location
        // Graphically render at new location
    }
}

class SoldierClient {
    var currentLocation: CGPoint
    
    let soldier: Soldier
    
    init(currentLocation: CGPoint, soldier: Soldier) {
        self.currentLocation = currentLocation
        self.soldier = soldier
    }
    
    func moveSoldier(to nextLocation: CGPoint) {
        soldier.render(from: currentLocation, to: nextLocation)
        currentLocation = nextLocation
    }
}

class SoldierFactory {
    
    enum SoldierType {
        case infantry
    }

    private var availableSoldiers =  [SoldierType: Soldier]()
    static let sharedInstance = SoldierFactory()
    
    private init(){}
    
    private func createSoldier(of type: SoldierType) -> Soldier {
        switch type {
        case .infantry:
            let infantry = Infantry(modelData: Data())
            availableSoldiers[type] = infantry
            return infantry
        }
    }
    
    func getSoldier(type: SoldierType) -> Soldier {
        if let soldier = availableSoldiers[type] {
            return soldier
        } else {
            let soldier = createSoldier(of: type)
            return soldier
        }
    }
}

let soldierFactory = SoldierFactory.sharedInstance
let infantry = soldierFactory.getSoldier(type: .infantry)
let firstSoldier = SoldierClient(currentLocation: CGPoint.zero, soldier: infantry)
let secondSoldier = SoldierClient(currentLocation: CGPoint(x: 5, y: 10), soldier: infantry)

firstSoldier.moveSoldier(to: CGPoint(x: 1, y: 5))

//: [Next](@next)
