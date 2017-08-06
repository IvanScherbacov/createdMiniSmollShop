import Foundation
struct Room {
    
    static let mapLvl = ["XXXXXXXXXXXX",
                         "XX   0     X",
                         "XXX    #   X",
                         "X   #   XXXX",
                         "X    X     X",
                         "X @  X    0X",
                         "XXXXXXXXXXXX"]
    static let height : Int = Room.mapLvl.count
    static let width  : Int = Room.mapLvl[0].characters.count
    
    static func mapChange () -> [String] {
        var field = [String]()
        var tmp = ""
        for (idx, value) in mapLvl.enumerated() {
            for char in value.characters {
                switch String(char) {
                case "X" : tmp = "\u{2b1b}"
                case "0" : tmp = "❌"
                case "#" :
                    tmp = Box.icon
                    Box.posicion.x = idx
                    Box.posicion.y = (value as NSString).range(of: "#").location
                case "@":
                    tmp = Human.icon
                    Human.posicion.x = idx
                    Human.posicion.y = (value as NSString).range(of: "@").location
                default : tmp = "\u{2b1c}"
                }
                field.append(tmp)
            }
        }
        return field
    }
    
    var field = Room.mapChange()
    
    func printField () {
        for i in 0..<Room.height{
            for j in 0..<Room.width {
                print (field[(i * Room.width) + j ])
            }
            print()
        }
    }
}

struct Point {
    var x : Int
    var y : Int
}

struct Box {
    static var posicion = Point(x: 0, y: 0)
    static var icon = "🔴"
}

struct Human {
    static var posicion = Point(x: 0, y: 0)
    static var icon = "🐼"
}

enum Direction {
    case Left, Right, Up, Down
}

var field = Room.mapChange()


func checkMove (pos:Point) -> Bool {
    return field[(pos.x * Room.width) + pos.y] != "\u{2b1b}"
}

func moveTo(dir: Direction, pos: inout Point) {
    switch dir {
    case .Down : if  field[(pos.x+1 * Room.width) + pos.y] != "\u{2b1b}" {
        field[(pos.x * Room.width) + pos.y] = "\u{2b1c}"
        field[(pos.x+1 * Room.width) + pos.y] = "🐼"
        pos.x += 1
        }
   case .Up : if field[(pos.x-1 * Room.width) + pos.y] != "\u{2b1b}" {
        field[(pos.x * Room.width) + pos.y] = "\u{2b1c}"
        field[(pos.x-1 * Room.width) + pos.y] = "🐼"
        pos.x -= 1
        }
    case .Left : if field[(pos.x * Room.width) + pos.y-1] != "\u{2b1b}" {
        field[(pos.x * Room.width) + pos.y] = "\u{2b1c}"
        field[(pos.x * Room.width) + pos.y-1] = "🐼"
        pos.y -= 1
        }
    case .Right : if  field[(pos.x * Room.width) + pos.y+1] != "\u{2b1b}" {
        field[(pos.x * Room.width) + pos.y] = "\u{2b1c}"
        field[(pos.x * Room.width) + pos.y+1] = "🐼"
        pos.y += 1
        }

    }

}

func printField (array: [String]) {
    for i in 0..<Room.height{
        for j in 0..<Room.width {
            print (field[(i * Room.width) + j ], terminator: " ")
        }
        print()
    }
}


printField(array: field)


moveTo(dir: .Down, pos: &Human.posicion)

printField(array: field)

moveTo(dir: .Down, pos: &Human.posicion)

moveTo(dir: .Left, pos: &Human.posicion)

















