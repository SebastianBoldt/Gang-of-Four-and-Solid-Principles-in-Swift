import Foundation

public class Shop {
    
    private var firstMechanics: MechanicSkillGroup
    
    public init(firstMechanics: MechanicSkillGroup){
        self.firstMechanics = firstMechanics
    }
    
    public func performJob(job: Job) -> Bool {
        return self.firstMechanics.performJobOrPassItUp(job: job)
    }
}
