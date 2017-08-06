
//MARK: #1

struct Students {
    var name : String
    var surname : String
    var yearOfBirth : Int
    var aScore : Int
}

let st1 = Students (name: "Ivan", surname: "Scherbacov", yearOfBirth: 1986, aScore: 10)
let st2 = Students (name: "Petr", surname: "Popov", yearOfBirth: 1989, aScore: 7)
let st3 = Students (name: "Denis", surname: "Popov", yearOfBirth: 1990, aScore: 9)
let st4 = Students (name: "Bob", surname: "Bobovich", yearOfBirth: 1978, aScore: 5)

//#2

var register = [st1, st2, st3, st4]

func printStudentsData ( students : [Students]) {
    for (index, data) in students.enumerated() {
        print ("\(index + 1) : \(data)")
    }
}
//printStudentsData(students: register)

//#3
print ("---------3")
register = register.sorted{ $0.aScore > $1.aScore }

//printStudentsData(students: register)

//MARK: #4

register = register.sorted{
    if $0.surname == $1.surname {
        return  $0.name < $1.name
    } else {
        return $0.surname < $1.surname
    }
}

//printStudentsData(students: register)

//#5

var tempSt = register

tempSt[0] = Students (name: "Ildar", surname: "Ryazanov", yearOfBirth: 1954, aScore: 8)
tempSt[1] = Students (name: "Kot", surname: "Matrosskin", yearOfBirth: 2001, aScore: 0)

printStudentsData(students: register)
printStudentsData(students: tempSt)




