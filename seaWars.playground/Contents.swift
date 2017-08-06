import Darwin
typealias Point = (x: Int, y: Int)
var ship1 = [Point(1, 4)]
var ship2 = [Point (10, 1)]
var ship3 = [Point (1, 10)]
var ship4 = [Point (6, 8)]
var ship5 = [Point(3, 2), Point(3, 3)]
var ship6 = [Point(3, 5), Point(3, 6)]
var ship7 = [Point(3, 8), Point(4, 8)]
var ship8 = [Point(5, 3), Point(5, 4), Point(5, 5)]
var ship9 = [Point(7, 4), Point(7, 5), Point(7, 6)]
var ship10 = [Point(9, 6), Point(9, 7), Point(9, 8), Point(9, 9)]

var myShips = [ship1, ship2, ship3, ship4, ship5, ship6, ship7, ship8, ship9, ship10]
var shipsDict = [String : Bool]()

//Create Battle Field

let blackcell = "\u{2b1b}", withecell = "\u{2b1c}", kill = "\u{1f480}", miss = "\u{20E4}", hit = "\u{1f525}"
var fieldArray = Array(repeating: Array(repeating: withecell, count: 10), count: 10) // создаем масив состоящий из массивов по 10 эл в каждом. 10 по 10 \u{2b1b}
for ship in myShips {
    
    for i in 0..<ship.count {
        fieldArray [ship[i].y - 1][ship[i].x - 1] = blackcell // fieldArray[1][1] дает доступ к элементу массива масивов 1 1 элемент, [2][5]  2 массив 5 элемент 2го массива.
        shipsDict ["\(ship[i].x)\(ship[i].y)"] = true   //создает уникальные ключи по которым есть или корабль или его часть.
            }
}
//print (shipsDict)

// Show Battlefield

for obj in fieldArray {
    for obj2 in obj {
        print(obj2, terminator: "")    // терминатор дает возм печатать по гориз
    }
    print()
}
// Make shots
var shotsDict = [String : Point]()

for _ in 0..<50 {
    var shot : Point
    repeat {
        shot = (Int(arc4random()) % 10+1, Int(arc4random()) % 10+1)
    } while shotsDict["\(shot.x)\(shot.y)"] != nil

    shotsDict["\(shot.x)\(shot.y)"] = shot
    //print status on the field
    switch shot {
        case (let x, let y) where shipsDict["\(x)\(y)"] == nil: fieldArray[y-1][x-1] += miss
        print ("shot \(x) : \(y) - MIsSS")
        
        case (let x, let y) where shipsDict["\(x)\(y)"] == true:
        shipsDict["\(x)\(y)"] = false
        fieldArray[y-1][x-1] = hit
        print ("shot \(x) : \(y) - HiT !!")
        
    default : break
        
        }
}
//Print kill status 

for ship in myShips{
    var count = 0
    for deck in ship {
        if shipsDict["\(deck.x)\(deck.y)"] == false {
            if count == ship.count {
                for deck in ship {
                    fieldArray[deck.y - 1][deck.y - 1] = kill
                }
            }
        }
    }
}

// Show Battelfield

for obj in fieldArray {
    for obj2 in obj {
        print(obj2, terminator: "")
    }
    print()
}
