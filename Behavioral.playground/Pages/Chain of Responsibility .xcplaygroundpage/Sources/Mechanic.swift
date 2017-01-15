import Foundation

public class Mechanic {
    let skill: Skill
    var name: String
    var isBusy: Bool = false
    
    public init(skill: Skill, name: String) {
        self.skill = skill
        self.name = name
    }
    
    public func performJob(job: Job) -> Bool {
        if job.minimumSkill.rawValue > self.skill.rawValue || isBusy == true {
            assert(false,"This mechanic is either busy or insufficiently skilled for this job, he should have never been perform it, there is something wrong in the chain")
            return false
        } else  {
            isBusy = true
            print("\(name) with skill set \(skill) has started to do \(job.name)")
            job.completed = true
            return true
        }
    }
}
