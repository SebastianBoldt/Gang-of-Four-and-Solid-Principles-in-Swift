//: [Previous](@previous)

import Foundation

protocol OlderDeathStarSuperLaserAiming {
    var angleV: NSNumber {get}
    var angleH: NSNumber {get}
}

struct DeathStarSuperLaserTarget {
    let angleHorizontal: Double
    let angleVertical: Double
}

struct OldDeathStarSuperlaserTarget : OlderDeathStarSuperLaserAiming {
    private let target : DeathStarSuperLaserTarget
    
    var angleV:NSNumber {
        return NSNumber(value: target.angleVertical)
    }
    
    var angleH:NSNumber {
        return NSNumber(value: target.angleHorizontal)
    }
    
    init(_ target:DeathStarSuperLaserTarget) {
        self.target = target
    }
}


let target = DeathStarSuperLaserTarget(angleHorizontal: 14.0, angleVertical: 12.0)
let oldFormat = OldDeathStarSuperlaserTarget(target)

oldFormat.angleH
oldFormat.angleV

//: [Next](@next)
