import UIKit

// Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.


var summ = 654.0
var percent = 7.0
var year = 5.0
// Задание под звёздочкой и в нём сказано, что пользователь сам должен вводить переменные, на уроке мы до такого не дошли, но если верить гуглу это должно выглядеть так:
//var summ = Int(readLine(strippingNewline: true)!)!
//var percent = Int(readLine(strippingNewline: true)!)!

summ = summ + (summ * percent * year / 100)
