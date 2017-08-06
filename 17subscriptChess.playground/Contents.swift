struct Chess {

    enum Color : String {
        case White = "\u{2b1c}"
        case Black = "\u{2b1b}"
    }
    
    static var chessCell = ""
    static let columnSimbol = "abcdefgh"
    static func installColor () -> [String:String] {
        var tmp = [String:String]()
        for (idx, value) in columnSimbol.characters.enumerated() {
            for j in 1...columnSimbol.characters.count {
                tmp[String(value) + String(j)] =
                    (idx+j) % 2 == 1  ? Color.Black.rawValue : Color.White.rawValue
            }
        }
        return tmp
    }

    let chessCellDict = Chess.installColor()
    
    subscript (column: String, row: Int) -> String? {
        get {
            return chessCellDict [column + String(row)]
        }
    }
    
    
}



let a = String(describing: UnicodeScalar((1+0x40)))



