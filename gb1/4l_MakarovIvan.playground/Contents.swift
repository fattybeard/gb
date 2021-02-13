import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum someAction {
    case windows(carWindowsAction)
    case engine(carEngineAction)
    case trailer(attachTrailer)
    case transmission(transmissionType)
    
}
enum carWindowsAction {
    case open, close
}

enum carEngineAction {
    case start, stop
}

enum attachTrailer {
    case attach, unattach
}
enum transmissionType{
    case sport, regular
}
class car {
    let color: UIColor
    let brand: String
    let year: Int
    var isWindowOpen: Bool = false
    var isEngineStart: Bool = false
    var isTrailerAttach: Bool = false
    var isTransmissonSport: Bool = false
    
    init(color: UIColor,brand: String, year: Int) {
        self.color = color
        self.brand = brand
        self.year = year
    }
    
    func performAction(with object: someAction) {
        switch object {
        case let .windows(action):
            isWindowOpen = action == .open
            print("\(brand) \(action) windows")
        case let .engine(action):
            isEngineStart = action == .start
            print("\(brand) \(action) engine")
        default:
            break
        }
    }
}


class sportCar: car {
    var maxSpeed: Int
    init(color: UIColor,brand: String, year: Int, maxSpeed: Int) {
        self.maxSpeed = maxSpeed
        super.init(color: color, brand: brand, year: year)
    }
    override func performAction(with object: someAction) {
        super.performAction(with: object)
        switch object {
        case let .transmission(action):
            isTransmissonSport = action == .sport
            print("\(brand) has \(action) transmisson")
        default:
            break
        }
    }
}


class trunkCar: car {
    var trunkVolume: Float
    init(color: UIColor,brand: String, year: Int, trunkVolume: Float){
        self.trunkVolume = trunkVolume
        super.init(color: color, brand: brand, year: year)
    }
    override func performAction(with object: someAction) {
        super.performAction(with: object)
        switch object {
        case let .trailer(action):
            isTrailerAttach = action == .attach
            print("Trailer has \(action)ed to \(brand)")
        default:
            break
        }
    }
}


var car1 = car(color: .white, brand: "Ford", year: 2000)
var car2 = sportCar(color: .black, brand: "Honda", year: 2020, maxSpeed: 300)
var car3 = trunkCar(color: .green, brand: "Scania", year: 2019, trunkVolume: 7921)

car1.performAction(with: .windows(.open))
car2.performAction(with: .windows(.open))
car2.performAction(with: .transmission(.sport))
car3.performAction(with: .trailer(.attach))
