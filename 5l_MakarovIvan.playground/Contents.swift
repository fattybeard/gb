import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

enum windows{
    case open, closed
}
enum engine{
    case start, stop
}
    
protocol Car {
    var brand: String {get}
    var year: Int {get}
    var engineState: engine {get set}
    var windowsState: windows {get set}
    func basicFunc()
}

extension Car {
    mutating func changeEngineState(engineState: engine){
        self.engineState = engineState
    }
    mutating func chageWindowsState(windowsState: windows){
        self.windowsState = windowsState
    }
    func basicFunc(){
        print("Do not tap the red button")
    }
}

class SportCar: Car, CustomStringConvertible {
    var brand: String
    var year: Int
    var maxSpeed: Int
    var engineState: engine = .stop
    var windowsState: windows = .closed
    init(brand: String, year: Int, maxSpeed: Int){
        self.brand = brand
        self.year = year
        self.maxSpeed = maxSpeed
    }
    
    var description: String {
        return "Car model \(brand) has \(windowsState)ed windows and \(engineState)ed engine. Max speed: \(maxSpeed)"
    }
}

class TrunkCar: Car, CustomStringConvertible {
    var brand: String
    var year: Int
    var trunkVolume: Int
    var engineState: engine = .stop
    var windowsState: windows = .closed
    init(brand: String, year: Int, trunkVolume: Int){
        self.brand = brand
        self.year = year
        self.trunkVolume = trunkVolume
    }

    var description: String {
        return "Trunk model \(brand) has \(windowsState)ed windows and \(engineState)ed engine. Trunk volume: \(trunkVolume)"
    }
}

var car1 = SportCar(brand: "Honda", year: 2020, maxSpeed: 250)
var car2 = TrunkCar(brand: "Scania", year: 2010, trunkVolume: 2000)
car1.chageWindowsState(windowsState: .open)
car1.changeEngineState(engineState: .stop)
print(car1.description)
print(car2.description)
