//MARK: SimpleShop

class Goods {
    
    var id = String()
    var price = Double()
    var title = String()
    var isUncovered = Bool()
    init (id: String, price: Double, title: String) {
        self.id = id
        self.price = price
        self.title = title
        self.isUncovered = false
    }
    
}

class Stock {
    
    static var goodsList : [Goods]!
    class func addGoods (new: Goods) {
        Stock.goodsList?.append(new)
    }
    
    class func amountGoods() -> Int? {
        return Stock.goodsList?.count ?? nil
    }
    
    class func findGoodsInStock(id: String) -> Goods? {
        
        for value in Stock.goodsList {
            if value.id == id {
                return value
            }
        }
        return nil
    }
    
    class func dellGoodsFromStock (sell id: String) {
        var tmp = 0
        for value in Stock.goodsList {
            if value.id == id {
                Stock.goodsList?.remove(at: tmp)
            }
            tmp += 1
        }
    }
    
}

class Cash {
    
    func sellGoods (goodsId: String, wallet : Double) {
        let findGoods = Stock.findGoodsInStock(id: goodsId)
        if let sellingGoods = findGoods {
            if sellingGoods.price < wallet {
                Stock.dellGoodsFromStock(sell: goodsId)
            }
        } else {
            print("Enough of money")
        }
    }
    
    func returnGoods (goods : Goods) {
        if goods.isUncovered {
            Stock.addGoods(new: goods)
        }
    }
}

