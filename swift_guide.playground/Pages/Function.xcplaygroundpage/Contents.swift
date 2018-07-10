//: [Назад](@previous)
import Foundation
let monstersOnMap: [String]     = ["Zombie", "Blue Plant", "Jakk", "Dracula"]
var poringDrop: [String: Float] = ["Apple": 10, "Candy": 5, "Candy Cane": 15, "Santa Hat": 1, "Santa Poring Card": 0.01]
//: ## Functions
//: **Функцией** называют блок кода, который может быть повторно использован,
//: уменьшая тем самым объем программы и улучшая её качество.  
/**
 canIGetThisItem - название функции
 - parameter dropList: Список вещей выпадающих с монстра.
 - parameter dropChance: Шанс **"дропа"**
 - returns: Исходящий параметр. В данном случае возвращает массив строк.
 */
func canIGetThisItem(_ dropList: [String: Float], dropChance: Float) -> [String] {
  var whatCanIGet: [String] = []
  for (item, chance) in dropList {
    if chance >= dropChance {
      whatCanIGet.append("Думается мне, что с моей удачей я вполне могу себе выбить \(item)")
    }
  }
  return whatCanIGet
}
//: Стоит заметить, что в объявлении функции мы можем поставить прочерк
//: перед первым (или единственным) параметром дабы при вызове функции не указывать его.
for item in canIGetThisItem(poringDrop, dropChance: 4.7) {
  print(item)
}

print("\n===========\n")
//: ## Необязательные параметры
//: Если по какой-то причине вы решили, что в вашей функции необходимы необязательные параметры,
//: то вы можете указать их как **Опциональные**.
func cooking(grape: Int, lemon: Int, strawberry: Int, orange: Int, alcohol: Int?) -> String? {
  if (grape >= 5 && lemon >= 4) {
    return "Morroc Fruit Wine"
  } else {
    return nil
  }
}

if (cooking(grape: 5, lemon: 4, strawberry: 1, orange: 9, alcohol: nil) != nil) {
  print("Получилось сварить Morroc Fruit Wine")
} else {
  print("Чейго-то нехватило для варки...")
}

print("\n===========\n")
//: ## Стандартное значение параметра
//: Так же существует возможность задать определённое значение для одного из параметров.
func makingIceArrows(glacialHeart: Int = 10) -> [String: Int] {
  return ["Crystal Arrow": 50, "Frozen Arrow": 50]
}

print("Накрутил себе сходу пачку стрел:", makingIceArrows())

print("\n===========\n")
//: ## Вариативный параметр
//: При необходимости можно добавить Вариативный параметр, принимающий любое количество значений.  
//: Внутри функции он будет доступен в формате Массива.
func boilingWhitePotion(whiteHerb: Int, emptyBottle: Int, spices: String ...) -> String? {
  if (whiteHerb > 0 && emptyBottle == 1) {
    return "White Potion"
  } else {
    return nil
  }
}

print("Сварю-ка я себе", boilingWhitePotion(whiteHerb: 1, emptyBottle: 1, spices: "Sugar", "Pepper")!, "с сахарком и перчиком, для остроты!")

print("\n===========\n")
//: ## Inout (параметр по ссылке)
//: Иногда необходимо при помощи функции изменять сам входящий параметр.  
//: Любой параметр можно передать по ссылке. То есть, он будет не копироваться внутрь функции,
//: а передаваться, как есть, и возвращаться уже изменённым.  
//: Необходимо пометить входящий параметр как **`“inout”`**, а передаваемую переменную пометить символом **`“&”`**.

var simpleFist: String = "Fist"

func lightningLoader(weapon: inout String, windOfVerdure: Int) -> String {
  if windOfVerdure >= 1 {
    return "Fist of Wind"
  } else {
    return "Fist"
  }
}

print("Зачарую я себе", lightningLoader(weapon: &simpleFist, windOfVerdure: 1))

print("\n===========\n")
//: ### Домашнее задание
//: Создайте несколько функций с использованием всех описанных выше возможностей.

//: [Вперёд](@next)
