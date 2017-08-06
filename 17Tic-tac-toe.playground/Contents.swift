struct Room {
    static var weigth : Int = 3
    static var height : Int = 3
    static var tic = "❌"
    static var tac = "🔴"
    static func createFieldDict () -> [String:String] {
        var tmp = [String:String]()
        for row in 1...Room.weigth{
            for line in 1...Room.height {
                tmp[String(row) + String(line)] = "\u{2b1c}"
            }
        }
        return tmp
    } //Create game field
    static var field = Room.createFieldDict()
    
    static func clearField (field: inout [String:String]) {
            field = Room.createFieldDict()
    } // Clear game field
    
    func prinfField (field: [String:String]) {
        for i in 1...Room.weigth {
            for j in 1...Room.height {
                print(Room.field[String(i) + String(j)]!, terminator: " ")
            }
            print(" ")
        }
    } // Print game field
    
    subscript (x: Int, y: Int)-> String? {
        get {
            return Room.field[String(x) + String(y)]
        }
        set {
            if newValue == Room.tac || newValue == Room.tic {
                if  Room.field[String(x) + String(y)] == "\u{2b1c}" {
                    Room.field[String(x) + String(y)] = newValue
                   // checkWinner(field: Room.field)
                    prinfField(field: Room.field)
                    print ("---------")// Print your step
                } else {
                    print ("You entered incorrect data. Enter \(Room.tac) or \(Room.tic) please")
                }
            }
        }
    }
   
}

var tictactoe = Room()


tictactoe[3,2] = Room.tic

Room.clearField(field: &Room.field)

tictactoe[1,2] = Room.tic

Room.clearField(field: &Room.field)

tictactoe[2,2] = Room.tac
tictactoe[2,2] = "asdasd"
tictactoe[1,2] = Room.tic
tictactoe[3,2] = Room.tac
tictactoe[2,3] = Room.tic
tictactoe[10,1] = Room.tic



