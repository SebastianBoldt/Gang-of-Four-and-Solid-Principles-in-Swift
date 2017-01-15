import Foundation

public enum Skill : Int {
    case OilChangeOnly = 1
    case Junior
    case Apprentice
    case MasterMechanic
}

public class Job {
    let minimumSkill: Skill
    let name: String
    var completed: Bool = false
    
    public init(minSkill: Skill, name: String) {
        self.minimumSkill = minSkill
        self.name = name
    }
}
