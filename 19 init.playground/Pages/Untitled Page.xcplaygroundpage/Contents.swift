//init


class Human {
    var weight : Int
    var age : Int
    
    init (weight: Int, age: Int) {
        self.age = age
        self.weight = weight
    }
    
    convenience init (age: Int) {
        self.init (weight: 0, age: age)
    }
    convenience init (weight: Int) {
        self.init(weight: weight, age: 0)
    }
    convenience init () {
        self.init(weight: 0)
    }
    
    func test () {}
}

class Student : Human {
    var firstName : String
    var lastName : String
    
    init (firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init(weight: 0, age: 0)
        weight = 50
        test()
    }
    override convenience init (weight: Int, age: Int) {
        self.init (firstName : "")
        self.weight = weight
        self.age = age
    }
    convenience init (firstName : String) {
        self.init(firstName: firstName, lastName: "")
        self.age = 40
        test()
    }
}

class Doctor : Student {
    
    var fieldOfStudy : String = ""
/*
    init (fieldOfStudy: String) {
        self.fieldOfStudy = fieldOfStudy
        super.init(firstName: "Doctor", lastName: "House")
    }
    */
    convenience init (fieldOfStudy: String) {
        self.init(firstName: "Doctor", lastName: "House")
        self.fieldOfStudy = fieldOfStudy
    }
}


let d1 = Doctor(firstName: "12")




enum Color : Int {
    case White, Black
    
    init? (value : Int) {
        switch value {
        case 0 : self = .Black
        case 1 : self = .White
        default:  return nil
        }
    }
}

let a = Color(value: 1)
a?.rawValue


struct Size {
    var width : Int
    var heigth : Int
    
    init? (width: Int, heigth: Int) {
        self.width = width
        if width < 0 {
            return nil
        }
        self.heigth = heigth
    }

}














