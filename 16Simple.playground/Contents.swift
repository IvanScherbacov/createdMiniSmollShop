struct Room {
    static var width: Int = 10
    static var length : Int = 10
}


enum Direction {
    case Left, Right, Up, Down
}

struct Point {
    let x : Int
    let y : Int
    mutating func moveBy(x: Int, y: Int) {
        self = Point (x: self.x + x, y: self.y + y)
    }
}

struct Human {
    static var bomb : Character = 💣
    static var human : Character = 👨
    static var white : Character = "\u{2b1c}"
    static var black : Character = "\u{2b1b}"
    static var hole : Character = 💢

    var posicion :Point {
        didSet {
            posicion.x = 1...Room.width ~= posicion ? posicion.x : oldValue
            posicion.y = 1...Room.length ~= posicion ? posicion.y : oldValue
        }
    }

    var bomb : Point {
        didSet {
        bomb.x = 1...Room.width ~= bomb ? bomb.x : oldValue
        bomb.y = 1...Room.length ~= bomb ? bomb.y : oldValue
        }
    }
    var human : Point {
        didSet {
            human.x = 1...Room.width ~= human ? human.x : oldValue
            human.y = 1...Room.length ~= human ? human.y : oldValue
        }
    }
    


}

