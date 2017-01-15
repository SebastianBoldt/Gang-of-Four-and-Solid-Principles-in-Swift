import Foundation

public class MechanicSkillGroup {
    
    var mechanics: [Mechanic]
    var nextLevel: MechanicSkillGroup?
    var skill: Skill
    
    public init(skill: Skill, mechanics: [Mechanic], nextLevel: MechanicSkillGroup?){
        self.mechanics = mechanics
        self.skill = skill
        self.nextLevel = nextLevel
    }
    
    public func performJobOrPassItUp(job: Job) -> Bool {
        // If the job has not the right skill level or there is no mechanic available
        if (job.minimumSkill.rawValue > skill.rawValue || mechanics.filter{ $0.isBusy == false }.count == 0 ) {
            if let nextLevel = nextLevel {
                return nextLevel.performJobOrPassItUp(job: job)
            } else {
                print("No one is available to do this Job")
                return false
            }
        } else {
            if let first = self.mechanics.filter({ $0.isBusy == false}).first {
                return first.performJob(job: job)
            } else {
                assert(false,"This should never happen because our if else statement is full exhaustive")
                return false
            }
        }
    }
}
