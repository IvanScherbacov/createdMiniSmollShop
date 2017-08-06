import UIKit
let text = "qwertyuiopasdfghjklzxcvbnmqazwsxedcrfvtgbyasdaa ::<<<ol1234e7654er345678987654ru76tr"
let vovel = "qeyuio"
let consonant = "wrtpsdfghjklzxcvbnm"
let num = "0123456789"

// func sorted
func filterText (string: String, clous: (String) -> Bool) -> [String] {
    var arrayed = [String]()
    var filtered = [String]()
    for i in string.characters {
        arrayed  += [String(i)]
    }
    for value in arrayed {
        if clous(value) {
            filtered.append(value)
        }
    }
    return filtered
}
// func transformation string to dictionary [:]
func stringToDicsh (string: String) -> [String:Bool] {
    var dict = [String:Bool]()
    var arrayed = [String]()
    for i in string.characters {
        arrayed.append(String(i))
    }

    for value in arrayed {
       dict[value] = true
    }
    return dict
}

let dictVovel = stringToDicsh(string: vovel)
let dictConsonant = stringToDicsh(string: consonant)
let dictNum = stringToDicsh(string: num)

let sortedText =
    filterText(string: text, clous: {dictVovel[$0] != nil}).sorted(by: <) +
    filterText(string: text, clous: {dictConsonant[$0] != nil}).sorted(by: <) +
    filterText(string: text, clous: {dictNum[$0] != nil}).sorted(by: <)

var sortedStringText = ""

for i in sortedText {
    sortedStringText += i
}
print (sortedStringText)





/////// 4 zadanie po prioritetam


let str  = "qwertyuiopasdfghjklzxcvbnmqazwsxedcrfvtgbyasdaa ::<<<ol1234e7654er345678987654ru76tr"



func priority(text: String) -> Int {
    switch text {
    case "q", "e", "y", "u", "i", "o", "a" : return 0
    case "a"..."z" : return 1
    case "1"..."9" : return 2
    default: return 3
    }
}
var arTxt = [String]()
for i in str.characters {
    arTxt.append(String(i))
}

let sorted =
arTxt.sorted {
    switch(priority(text: $0),priority(text: $1)) {
    case let (x, y) where x > y : return true
    case let (x, y) where x < y : return false
    default: return $0 <= $1
    }
}



let a :ClosedRange = "0"..."9"






