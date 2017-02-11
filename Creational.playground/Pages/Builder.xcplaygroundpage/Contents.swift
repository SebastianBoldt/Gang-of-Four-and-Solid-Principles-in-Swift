//: [Previous](@previous)

import Foundation

class StudentBuilder {
    var firstName : String?
    var lastName : String?
    var age : Int?
    
    init(buildClosure: (StudentBuilder) -> ()){
        buildClosure(self)
    }
}

struct Student  {
    let firstName : String
    let lastName : String
    let age : Int
    
    init?(builder: StudentBuilder) {
        if let firstName = builder.firstName, let lastName = builder.lastName, let age = builder.age {
            self.firstName = firstName
            self.lastName = lastName
            self.age = age
        } else {
            return nil
        }
    }
}

let studentBuilder = StudentBuilder{ builder in
    builder.age = 10
    builder.firstName = "Sebastian"
    builder.lastName = "Boldt"
}

let student = Student(builder: studentBuilder)
student?.lastName
student?.firstName
student?.age

//: [Next](@next)
