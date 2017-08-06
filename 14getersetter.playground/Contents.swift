import Foundation

struct Student {

    var name : String {
        willSet {
            print("will set " + newValue + " instead of " + name)
        }
        didSet {
            print("did set " + name + " istead of " + oldValue)
            name = name.capitalized
        }
    }
    
    var surname : String {
        didSet {
            print("did set " + surname + " istead of " + oldValue)
            surname = surname.capitalized
        }
    }
    
    var fullname : String {
        
        get {
            return name + " " + surname
        }
    
        set {
            print(fullname + " is changing to " + newValue)
            
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                name = words[0]
            }
            
            if words.count > 1 {
                surname = words [1]
            }
            
        }
    }
}

struct Dob {
    
    var day : Int {
        didSet {
            if  day < 0 || day > 31 {
                day = 1
                print ("You entered incorrectly date, day instaled 1 by default ")
            }
        }
    }
    var month : String? {
        didSet{
            let monthes = ["jul", "feb", "mar", "apr", "may", "jun", "jul", "avg", "sep", "oct", "nov", "des"]
            t:  for i in monthes {
                if month != nil {
                    if month! != i {
                    month = oldValue!
                    print ("You typed the name of the month incorrectly! Enter like as: jan, feb ....")
                        break t
                    } else {
                        month! = i
                    }
                }
            }
        }
    }
    
    var year : Int {
        didSet {
            if  year < 1850 || year > 2016 {
                year = 1980
                print ("You entered incorrectly date, year instaled 1980 by default ")
            }
        }
    }

    var age : Int {
       return 2017 - year
    }
    
    var expiriens : Int {
        if age < 6 {
            return 0
        } else {
            return age - 6
        }
    }
}

var student = Dob (day: 27, month: "jul", year: 1986)

student.age
student.expiriens


student.day = -18
student.day
student.year = 2029
student.month = "july"
print(student.month!)

//MARK: #2 line

struct LineSegment {
    struct Point {
        var x : Double
        var y : Double
    }
    
    var pointA : Point
    var pointB : Point
    var midllePointC : Point {
        get {
            let midllePointCx = (pointA.x + pointB.x)/2
            let midllePointCy = (pointA.y + pointB.y)/2
            return Point(x: midllePointCx, y: midllePointCy)
        }
        
        set {
            let midllePointCx = newValue.x - midllePointC.x
            let midllePointCy = newValue.y - midllePointC.y

            pointA.x += midllePointCx
            pointB.x += midllePointCx
            pointB.y += midllePointCy
            pointA.y += midllePointCy
        }
    }
    var length : Double {
        get {
            return hypot((pointB.x-pointA.x), (pointB.y-pointA.y))
        }
        set {
            let dx = (pointB.x-pointA.x)*(newValue-length)/length
            let dy = (pointB.y-pointA.y)*(newValue-length)/length
            pointB.y = dy
            pointB.x = dx
        }
    }
}
var segment = LineSegment (pointA: LineSegment.Point(x: 1, y: 5), pointB: LineSegment.Point(x: 6, y: 8))

segment.midllePointC.x = 10
segment.midllePointC.y = 15
segment.pointA
segment.pointB

segment.length = 76.976
segment.pointA
segment.pointB


//MARK: 15Hw #1


var Data = "121-231291-239012381020-23901283901-12313"

struct File {

    static let maxSize = Int.max
    var path : String
    var isHidden: Bool

    var name : String {
        return (path as NSString).lastPathComponent
    }
    var contents : String {
        if isHidden == true {
           return "Acsess denied"
        }
        return Data
    }
}


class Human {
    
    static let maxAge = 120
    static let minAge = 1
    static let lengthMin = 2
    static let lengthMax = 2
    static let minGrowth = 50
    static let minWeigth = 3
    static var totalHuman = 0
    
    var name : String {
        didSet {
            name = Human.lengthMin...Human.lengthMax ~=
                name.characters.count ? name : oldValue
            name = name.capitalized
        }
    }
    var lastName : String {
        didSet {
            lastName = Human.lengthMin...Human.lengthMax ~=
                lastName.characters.count ? lastName : oldValue
            lastName.capitalized
        }
    }
    var age : Int {
        didSet {
            age = Human.minAge...Human.maxAge ~= age ? age : oldValue

        }
    }
    var growth : Int {
        didSet {
            growth = growth > Human.minGrowth ? growth : oldValue
        }
    }
    var weight : Int {
        didSet {
            weight = weight > Human.minWeigth ? weight : oldValue
        }
    }

    func sipleDescription () -> String {
        return "Full name \(lastName) \(name) age \(age) weight\(weight) growth \(growth)"
    }
    
    init (name : String, lastName : String, age : Int, growth : Int, weight : Int) {

        self.name = name
        self.lastName = lastName
        self.age = age
        self.growth = growth
        self.weight = weight
        Human.totalHuman += 1
    }
}


let ivan = Human (name: "IVAN", lastName: "Scherbacov", age: 31, growth: 187, weight: 78)
let yasya = Human (name: "Yasya", lastName: "No", age: 10, growth: 20, weight: 5)
Human.totalHuman




yasya.sipleDescription()





