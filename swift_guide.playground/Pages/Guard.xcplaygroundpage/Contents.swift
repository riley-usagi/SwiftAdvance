//: [Назад](@previous)
import Foundation
//: ## Guard (охраный оператор)
//: **Guard** позволяет исполнять какие-либо действия, если операция не удовлетворяет условиям булевого выражения.
//: Исполняется **Guard** только в случае неудачи и чаще всего используется для выхода из тела функции.

class Iron {
  let name: String = "Iron"
  var count: Int = 4
}

class Coal {
  let name: String = "Coal"
  var count: Int = 2
}

class Steel {
  let name: String = "Steel"
}

func craftSteel(iron: Iron, coal: Coal) -> Steel? {
  guard iron.count < 5 && coal.count < 1 else {
    print("Недостаточно ингредиентов.")
    return nil
  }
  let newSteel = Steel()
  return newSteel
}

let ironPack = Iron()
let coalPack = Coal()

craftSteel(iron: ironPack, coal: coalPack)

//: ### Домашнее задание
//: [Вперёд](@next)
