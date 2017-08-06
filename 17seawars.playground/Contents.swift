import Foundation

struct Bfield {
    
    static let w = 10
    static let h = 10
    
    static var field = Array(repeating: Array(repeating: "\u{2b1c}", count: Bfield.w ), count: Bfield.h)
    
    static func printField () {
        for row in 0..<Bfield.h {
            for line in 0..<Bfield.w {
                print(Bfield.field[row][line], terminator: "")
            }
            print()
        }
    }
    
    static func clearField () -> [[String]] {
        return Bfield.field
    }
    
   // subscript ()
}

struct Coord {
    var x : ClosedRange
    var y : ClosedRangeInt
    var w :Int
    var h :Int
}

struct Ships {
    
    static let sh1 = Coord(x: 1, y: 1...4, w: 1, h: 4)
    static let sh2 = Coord(x: 1, y: 6...7, w: 1, h: 2)
    static let sh3 = Coord(x: 1, y: 9...10, w: 1, h: 2)
    static let sh4 = Coord(x: 3...5, y: 1, w: 1, h: 3)
    static let sh5 = Coord(x: 7...10, y: 1, w: 1, h: 3)
    static let sh6 = Coord(x: 10, y: 7...8, w: 1, h: 3)
    static let sh7 = Coord(x: 5, y: 2, w: 1, h: 3)
    static let sh8 = Coord(x: 5, y: 4, w: 1, h: 3)
    static let sh9 = Coord(x: 7, y: 2, w: 1, h: 3)
    static let sh10 = Coord(x: 7, y: 4, w: 1, h: 3)
    
}
