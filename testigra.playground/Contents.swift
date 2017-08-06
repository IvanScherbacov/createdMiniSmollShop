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
                    tmp = Box.image
                    Box.coordinates.x = idx
                    Box.coordinates.y = (value as NSString).range(of: "#").location
                case "@":
                    tmp = Human.image
                    Human.coordinates.x = idx
                    Human.coordinates.y = (value as NSString).range(of: "@").location
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
    
    func checkValidMoveToMap (row: Int, line: Int) -> Bool {
            return field[(row * Room.width) + line] != "\u{2b1b}"
        }
        
    func checkCollision (row: Int, line: Int) -> Bool {
        return field[(row * Room.width) + line] != Box.image
    }
}





typealias Point = (x: Int, y: Int)
struct Box {
    
    static var image = "🔴"
    static var coordinates : Point = (x: 0, y: 0)
    static func moveBox (dir: Direction, room: inout: Room, var pos: Point){
        checkValidMoveToMap(dir: dir, &pos)
        room [pos.x, pos.y] = Box.image
        }
    }
struct Human {
    
    static var image = "🐼"
    static var coordinates : Point = (x: 0, y: 0)
    static func moveHuman (dir: Direction, room: inout: Room){
        checkValidMoveToMap(dir: dir, &Hun)
        room [pos.x, pos.y] = Box.image
    }

}

enum Direction {

    case Left
    case Right
    case Up
    case Down
}

var room = Room()
