//: [Previous](@previous)

import Foundation

protocol Task {
    func execute() -> String
}

struct ImageTask : Task {
    func execute() -> String {
       return "Imagetask Complete"
    }
}

struct DataTask : Task {
    func execute() -> String {
        return "Datatask completed"
    }
}

struct TaskGroup : Task {
    private var tasks : [Task]
    
    public init(tasks:Task...) {
        self.tasks = tasks
    }
    
    func execute() -> String {
        var allResults = ""
        for (index,task) in tasks.enumerated() {
            allResults +=  (index == 0 ? "" : " | ") + task.execute()
        }
        return allResults
    }
}


let imageTask = ImageTask()
let dataTask = DataTask()
imageTask.execute()
dataTask.execute()

let group = TaskGroup(tasks: imageTask,dataTask)
group.execute()

//: [Next](@next)
