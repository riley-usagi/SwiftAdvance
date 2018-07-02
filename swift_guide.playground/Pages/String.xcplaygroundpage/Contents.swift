//: [Previous](@previous)

import Foundation

//: ## String (строка)
//: Объект содержащий в себе набор символов. Проще говоря: строка.
let race: String  = "Растение"
let jelly: String = "Желеобразное "

let newString: String = jelly + race.lowercased()

newString.prefix(5)

/*:
 Для того чтобы получить часть строки в определённом диапазоне
 необходимо произвести довольно громоздкую процедуру.
 Да, порой даже в Swift встречаются жуткие вещи наподобие этой:
*/
let start       = newString.index(newString.startIndex, offsetBy: 7)
let end         = newString.index(newString.endIndex, offsetBy: -6)
let range       = start..<end
let mySubstring = newString[range]
/*:
 В дальнейшем подобное можно вынести в отдельное Расширение (extension), к примеру.
 Но об этом мы поговорим в следующих уроках.
*/
//: ### Домашнее задание
//: Попрактикуйтесь в работе со строками.

//: [Next](@next)


