import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3 *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.



struct Queue <T> {
    var array: [T] = []
    subscript (index: Int) -> T? {
        get {
            return array[index]
        }
        set {
            guard newValue != nil else { return }
            array[index] = newValue!
        }
    }
    mutating func addToQueue(_ element: T) {
        self.array.append(element)
    }
    mutating func quitFromQueue() -> T {
        self.array.removeFirst()
    }
    
    mutating func removeAll<T>(where condition: (T) -> Bool) -> [T] {
        var array: [T] = []
        for (index, element) in array.enumerated().reversed() {
            if condition(element) {
                array.remove(at: index)
            }
        }
        return array
    }

}

extension Array {
    func compactMap<T>(clousure: (Element) -> T?) -> [T]{
        var array = [T] ()
        for element in self {
            switch clousure(element) {
            case let .some(element):
                array.append(element)
            case .none:
                continue
            }
        }
        return array
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}

var test = Queue<Int>()
test.addToQueue(1)
test.addToQueue(2)
test.addToQueue(3)
test.addToQueue(4)
test.addToQueue(5)
test[0]
test[0] = 4
test[0]
test.quitFromQueue()
test[0]


