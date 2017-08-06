//MARK: #1

enum Figures {

    enum Colors :String {
        case White = "White", Black = "Black"
    }
    
    typealias Pos = (hor : String, ver : Int)

    case Pawn (Colors, Pos)
    case Rooc (Colors, Pos)
    case Bishop (Colors, Pos)
    case Knight (Colors, Pos)
    case Queen (Colors, Pos)
    case King (Colors, Pos)
}

var f1 = Figures.King(.Black, ("h", 1))
var f2 = Figures.King(.White, ("h", 3))
var f3 = Figures.Bishop(.White, ("f", 3))
var f4 = Figures.Bishop(.Black, ("e", 3))

var figuresArray = [f1, f2, f3, f4]
//MARK: #2
typealias FigureInfo = (name : String, color : Figures.Colors, pos : Figures.Pos)

enum FigureName : String {
    case Pawn = "Pawn"
    case Rooc = "Rooc"
    case Bishop = "Bishop"
    case Knight = "Kinght"
    case Queen = "Queen"
    case King = "King"
}

func figureInfo(figure: Figures) -> FigureInfo {
    
    switch figure {
    case let .Pawn (col, pos)   : return (FigureName.Pawn.rawValue, col, pos)
    case let .Rooc (col, pos)   : return (FigureName.Rooc.rawValue, col, pos)
    case let .Bishop (col, pos) : return (FigureName.Bishop.rawValue, col, pos)
    case let .Knight (col, pos) : return (FigureName.Knight.rawValue, col, pos)
    case let .Queen (col, pos)  : return (FigureName.Queen.rawValue, col, pos)
    case let .King (col, pos)   : return (FigureName.King.rawValue, col, pos)
    }
}

func printFigure (figure : Figures) {
    let inf = figureInfo(figure: figure)
    print ("\(inf.color.rawValue)\(inf.name) in \(inf.pos.hor) \(inf.pos.ver)")
}

func printFigure(arrayFigures : [Figures]) {
    for i in arrayFigures {
        printFigure(figure: i)
    }
}
        
printFigure(arrayFigures: figuresArray)
        
//MARK: #3

func draw(figures: [Figures]) {
    func figureView (figure: Figures)->Character? {
        typealias Color = Figures.Colors
        
        switch figure {
        case let .Pawn (col,_)   where col == .White: return "♙"
        case let .Rooc (col,_)   where col == .White: return "♖"
        case let .Bishop (col,_) where col == .White: return "♗"
        case let .Knight (col,_) where col == .White: return "♘"
        case let .Queen (col,_)  where col == .White: return "♕"
        case let .King (col,_)   where col == .White: return "♔"
        case let .Pawn (col,_)   where col == .Black: return "♟"
        case let .Rooc (col,_)   where col == .Black: return "♜"
        case let .Bishop (col,_) where col == .Black: return "♝"
        case let .Knight (col,_) where col == .Black: return "♞"
        case let .Queen (col,_)  where col == .Black: return "♛"
        case let .King (col,_)   where col == .Black: return "♚"
        default: return nil
        }
    }

    func figure(pos: Figures.Pos) -> Character? {
        for i in figures {
            let info = figureInfo(figure: i)
            if pos.hor == info.pos.hor && pos.ver == info.pos.ver {
                return figureView(figure: i)
            }
        }
        return nil
    }

    let hor = "abcdefgh"
    let ver = 1...8

    for i in ver {
        print("\(9 - i)")
        for (j, x) in hor.characters.enumerated() {
            
            if let figure = figure(pos: (String(x), 9 - i)) {
                print (figure,  terminator : "")
                continue
            }
            print(i % 2 == j % 2 ? "\u{2b1b}" : "\u{2b1c}", terminator : "")
            
        }
    }
  print("   a b c d e f g h")
}

//draw(figures: figuresArray)

//MARC: #4


func move( figure f: inout Figures, pos: Figures.Pos, verifyPos: (Figures.Pos)->Bool) {
    if !verifyPos(pos) {
        print ("\(pos) : error")
        return
    }
    
    if let name = FigureName(rawValue: figureInfo(figure: f).name) {
        print ("\(name.rawValue): \(figureInfo(figure: f).pos) -> \(pos)")
    }
}




        
        
        
        
        
        
        

