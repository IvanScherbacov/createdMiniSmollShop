let mapLvl =        ["XXXXXXXXXXXX",
                     "XX   0     X",
                     "XXX    #   X",
                     "X   #   XXXX",
                     "X    X     X",
                     "X @  X    0X",
                     "XXXXXXXXXXXX"]

let height : Int = mapLvl.count
let width  : Int = mapLvl[0].characters.count

func mapChange (array: [String]) -> [String] {
    var field = [String]()
    var tmp = ""
    for value in array {
        for char in value.characters {
            switch String(char) {
            case "X" : tmp = "\u{2b1b}"
            case "0" : tmp = "❌"
            case "#" : tmp = "🔴"
                
            case "@": tmp = "🐼"
            default : tmp = "\u{2b1c}"
            }
            field.append(tmp)
        }
    }
    return field
}

var a = mapChange(array: mapLvl)
var b = [String]()

func printField (array: [String]) {
    for i in 0..<height{
        for j in 0..<width {
            print(array[(i * width) + j], terminator: " ")
        }
        print()
    }
}
printField(array: a)

