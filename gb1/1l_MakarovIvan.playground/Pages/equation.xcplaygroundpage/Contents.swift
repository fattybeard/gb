import UIKit

// Решить квадратное уровнение
// x2 − 2x − 3 = 0


let a = 1.0
let b = -2.0
let c = -3.0
var x1 = 0.0
var x2 = 0.0

var d = (b*b) - 4*a*c

if (d==0){
    x1 = (-b+sqrt(d))/(2*a)
    // Почему sqrt не работало пока не поставил десятичный знак у a,b,c...?
}

if (d>0){
    x1 = (-b+sqrt(d))/(2*a)
    x2 = (-b-sqrt(d))/(2*a)
}

if (d<0){
  print ("has no root")
}



