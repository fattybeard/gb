import UIKit

enum PaymentsError: Error {
    case notEnougtMoney (value: Int)
    case unknownElement
}

struct Items{
    var price: Int
    var product: Product
}

struct Product{
    let name: String
}

class InAppPurchase{
    var cardAmount = 50
    var elements = [
        "super chest": Items(price: 25, product: Product(name: "super chest")),
        "super pants": Items(price: 25, product: Product(name: "super pants")),
        "super blaster": Items(price: 50, product: Product(name: "super blaster"))
    ]
    
    func getInApp(itemNamed name: String) -> Result<Product, PaymentsError>{
        guard let item = elements[name] else {
            return .failure(.unknownElement)
        }
        guard item.price <= cardAmount else {
            return . failure(.notEnougtMoney(value: item.price - cardAmount))
        }
        cardAmount -= item.price
        return .success(item.product)
    }
    
}


class InAppPurchase2{
    var cardAmount = 50
    var elements = [
        "super chest": Items(price: 25, product: Product(name: "super chest")),
        "super pants": Items(price: 25, product: Product(name: "super pants")),
        "super blaster": Items(price: 50, product: Product(name: "super blaster"))
    ]
    
    func getInApp(itemNamed name: String) throws -> Product {
        guard let item = elements[name] else {
            throw PaymentsError.unknownElement
        }
        guard item.price <= cardAmount else {
            throw PaymentsError.notEnougtMoney(value: item.price - cardAmount)
        }
        cardAmount -= item.price
        return item.product
    }
    
}
