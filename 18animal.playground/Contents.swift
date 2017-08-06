class Animals {
    var iSreptiles : Bool { return true }
    var iSfourLegget : Bool { return true }
    var iSanimals : Bool { return true }
    var iSalive : Bool { return true }
}

class Human : Animals {
    override var iSfourLegget: Bool { return false }
    override var iSanimals: Bool { return false }
    override var iSreptiles: Bool { return false }
}

class Monkey : Animals {
    override var iSreptiles: Bool { return false }
    override var iSfourLegget: Bool { return false }
}

class Dogs : Animals {
    override var iSreptiles: Bool { return false }
}

class Crocodile : Animals {
    override var iSanimals : Bool { return false }
}

let human1 = Human()
let human2 = Human()
let monkey1 = Monkey()
let monkey2 = Monkey()
let dog1 = Dogs()
let dog2 = Dogs()
let croco1 = Crocodile()
let croco2 = Crocodile()

let animals = [human1, human2, monkey1, monkey2, dog1, dog2, croco1, croco2]



func filterAndPrint (array: [Animals]) {
    var iSreptiles = 0
    var iSfourLegget = 0
    var iSanimals = 0
    var iSalive = 0
    for value in animals {
        if value.iSalive{
            iSalive += 1
        }
        if value.iSanimals {
            iSanimals += 1
        }
        if value.iSfourLegget {
            iSfourLegget += 1
        }
        if value.iSreptiles {
            iSreptiles += 1
        }
    }
    print("Alive - \(iSalive)")
    print("Four-leggs - \(iSfourLegget)")
    print("Reptiles - \(iSreptiles)")
    print("Animals - \(iSanimals)")
}

filterAndPrint(array: animals)

