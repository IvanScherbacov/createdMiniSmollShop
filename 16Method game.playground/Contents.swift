struct Room {
    
    static let rangeH : ClosedRange = 0...20
    static let rangeW : ClosedRange = 0...20
    
    
    
    var height : Int {
        didSet {
            height  = Room.rangeH ~= height ? height : oldValue
        }
    }
    var width : Int  {
        didSet {
            width  = Room.rangeW ~= width ? width : oldValue
        }
    }
    init (height: Int, width: Int) {
        
        self.height = Room.rangeH ~= height ? height : Room.rangeH.lowerBound
        self.width = Room.rangeW ~= width ? width : Room.rangeW.lowerBound
    }
}

struct Object {
    
    static var human : Room
    //var box : Room
    
    func moveToLeft ( obj: inout Object) -> Object {
        let w = obj.human.width
        var h = obj.human.height + 1
        h = Room.rangeH ~= h ? w : h - 1
        return Object.init(human: Room (height: h, width: w))
    }
    func moveToRight ( obj: inout Object) -> Object {
        let w = obj.human.width
        var h = obj.human.height - 1
        h = Room.rangeH ~= h ? w : h + 1
        return Object.init(human: Room (height: h, width: w))
    }
    func moveToTop ( obj: inout Object) -> Object {
        let h = obj.human.height
        var w = obj.human.width + 1
        w = Room.rangeW ~= w ? w : w - 1
        return Object.init(human: Room (height: h, width: w))
    }
    func moveToDown ( obj: inout Object) -> Object {
        let h = obj.human.height
        var w = obj.human.width - 1
        w = Room.rangeW ~= w ? w : w + 1
        return Object.init(human: Room (height: h, width: w))
    }
}

var human = Object(human: Room(height: 0, width: 0))

human.moveToLeft(obj: &human)
human.moveToDown(obj: &human)
human.moveToTop(obj: &human)
human.moveToDown(obj: &human)

struct Field {

    static let white = "\u{2b1b}"
    static let black  = "\u{2b1c}"
    typealias View = (Object, String)
    var humanView : View

}

