import UIKit
//
// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
// 6. Вывести значения свойств экземпляров в консоль.

enum carWindowsState {
    case open, close
}

enum carEngineState {
    case start, stop
}

struct SportCar {
    let brand: String
    let year: Int
    var trunkVolume: Float
    var windowsState: carWindowsState
    var engineState: carEngineState
    
    mutating func changeWindowsState(value: String){
        switch value {
        case "open":
            windowsState = .open
        case "close":
            windowsState = .close
        default:
            print("error")
        }
        
    }
    
    mutating func changeEngineState(value: String){
        switch value {
        case "start":
            engineState = .start
        case "stop":
            engineState = .stop
        default:
            print("error")
        }
        
    }
    
    var loadCargo: Float{
        willSet {
            if (newValue > 0) && (newValue < trunkVolume){
                let value = newValue
                print ("Багажник наполнен \(value) литрами груза")
            } else {
                print ("Введенное значение превышает объем багажника")
            }
        }
    }
    var unloadCargo: Float{
        willSet {
            if (newValue > 0) && (newValue < trunkVolume){
                let value = newValue
                print ("Багажник опусташен на \(value) литров груза")
            } else {
                print ("Невозможно забрать груза больше, чем находится в багажнике")
            }
        }
    }
            
}


struct TrunkCar {
    let brand: String
    let year: Int
    var truckVolume: Float
    var windowsState: carWindowsState
    var engineState: carEngineState
    
    mutating func changeWindowsState(value: String){
        switch value {
        case "open":
            windowsState = .open
        case "close":
            windowsState = .close
        default:
            print("Введено неверное значение")
        }
        
    }
    
    mutating func changeEngineState(value: String){
        switch value {
        case "start":
            engineState = .start
        case "stop":
            engineState = .stop
        default:
            print("Введено неверное значение")
        }
        
    }
    
    var loadCargo: Float{
        willSet {
            if (newValue > 0) && (newValue < truckVolume){
                let value = newValue
                print ("Кузов наполнен \(value) литрами груза")
            } else {
                print ("Введенное значение превышает объем кузова")
            }
        }
    }
    var unloadCargo: Float{
        willSet {
            if (newValue > 0) && (newValue < truckVolume){
                let value = newValue
                print ("Кузов опусташен на \(value) литров груза")
            } else {
                print ("Невозможно забрать груза больше, чем находится в кузове")
            }
        }
    }
            
}

var car1 = SportCar(brand: "Honda", year: 2010, trunkVolume: 120, windowsState: .close, engineState: .start, loadCargo: 10, unloadCargo: 20)
var car2 = SportCar(brand: "Lada", year: 1976, trunkVolume: 70, windowsState: .open, engineState: .stop, loadCargo: 18.5, unloadCargo: 29)

var truck1 = TrunkCar(brand: "Scania", year: 2020, truckVolume: 10000, windowsState: .close, engineState: .stop, loadCargo: 500, unloadCargo: 100)
var truck2 = TrunkCar(brand: "Volvo", year: 1999, truckVolume: 4700, windowsState: .open, engineState: .start, loadCargo: 1200, unloadCargo: 2400)

car1.loadCargo = 20
car1.unloadCargo = 10
car1.changeEngineState(value: "stop")
car1.changeWindowsState(value: "open")
truck2.changeWindowsState(value: "выкл")
