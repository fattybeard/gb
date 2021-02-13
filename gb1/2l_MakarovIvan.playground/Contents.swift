import UIKit


//Написать функцию, которая определяет, четное число или нет.
func even (value: Int) {
    let number = value
    let even = number % 2
    if even == 0 {
        print("Четное число")
    } else {
        print("Нечетное число")
    }
}

even(value: 5)

//Написать функцию, которая определяет, делится ли число без остатка на 3

func divide3 (value: Int) {
    let number = value
    let divide =  number % 3
    if divide == 0 {
        print("Число делится 3 без остатка")
    } else {
        print("Число не делится на 3 без остатка")
    }
}

divide3 (value: 4)

//Создать возрастающий массив из 100 чисел.

var array: [Int] = Array(1...100)

//Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for element in array where (element % 2 == 0) || (element % 3 == 0) {
    array.remove (at : (array.firstIndex(of: element)!))
}
print (array)


