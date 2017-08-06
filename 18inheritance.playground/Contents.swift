class Artist {
    var name : String = ""
    var lastname : String = ""
    var fullName : String {
        return lastname + " " + name
    }

    func action () {
        print (fullName)
    }
}

class Dancer : Artist {
    
    override func action() {
        print(fullName + "👯💃")
    }
}

class Musician : Artist {
    override func action() {
        print(fullName + "🎺 🎻 🎼🎵 🎶♩ ♪ ♫ ♬♩ ♪ ♫ ♬♩ ♪ ♫ ♬♩ ♪ ♫ ♬")
    }
}

class Painter : Artist {
    
    override var name: String {
        get {
            return super.name
        }
        set {
            super.name = "Uldrick"
        }
    }
    override var lastname: String {
        get {
            return  super.lastname
        }
        set {
            super.lastname = "Puldrick"
        }
    }
    override func action() {
        print(fullName + "🐂 🐃 🐄 🐅 🐆 🐇 🐈 🐉 🐊 🐋")
    }

    
}

let dancer = Dancer()
dancer.name = "IsMyLife"
dancer.lastname = "Dance"
let musucian = Musician()
musucian.name = "Pol"
musucian.lastname = "Makkartni"
let knightOfTheBrush = Painter()
knightOfTheBrush.name = "Dnfksdjnfsf"
knightOfTheBrush.lastname = "asdwdqff"
let array = [dancer, musucian, knightOfTheBrush]


// #2

class Transport {
    var speed  : Int {
        get { return self.speed
        }
        set {
        self.speed = newValue
        }
    }
    
    var volume : Int {
        get { return self.volume
        }
        set {
        self.volume = newValue
        }
    }
    
    var costAt100 : Int {
        get { return self.costAt100
        }
        set {
            self.costAt100 = newValue
        }
    }


    func calculatingTimeAndCost (distanse : Int, people: Int) -> (time: Int, cost: Int) {
        var lengthAB = Int()
        var totalData : (time: Int, cost: Int)
        lengthAB = people/volume * 2 * distanse
        totalData = (time: lengthAB/speed, cost: lengthAB*costAt100)
        return totalData
    }
}

class Airplane : Transport {
}

class Car : Transport {
}

class Train : Transport {
}

let airplane = Airplane()
airplane.costAt100 = 100
airplane.speed = 850
airplane.volume = 350

let car = Car()
car.costAt100 = 10
car.speed = 100
car.volume = 4

let train = Train()
train.costAt100 = 50
train.speed = 70
train.volume = 500

let array2 = [airplane, car, train]

for value in array2 {
    print(value.calculatingTimeAndCost(distanse: 500, people: 100))
}
for value in array2 {
    print(value.calculatingTimeAndCost(distanse: 500, people: 1000))
}


// #3














