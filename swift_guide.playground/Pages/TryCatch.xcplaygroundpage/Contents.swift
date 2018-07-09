//: [Назад](@previous)
import Foundation
//: ## Try / Catch
//: Для упрощения работы с исключениями в **Swift** существует такой инструмент как - **throws**
//: Все функции помеченные ключевым словом **throws** обязаны возвращать *исключение* лишая тем самым функцию возможностей к непредвиденному завершению приложения.
//: > **Исключения** это ошибки имплементирующие протокол **Error**
//: По сути своей мы просто обрабатываем все возможные ошибки в *guard'e* с использованием **throws**.

enum ShopError: Error {
  case wrongItem
  case needMoreZeny(zenyNeeded: Int)
}

struct Item {
  let name: String
}

struct InStoreItem {
  var price, count: Int
  let item: Item
}

class littleMerchantShop {
  var itemsList = [
    "Red Potion": InStoreItem(price: 40, count: 270, item: Item(name: "Red Potion")),
    "Coal": InStoreItem(price: 420, count: 71, item: Item(name: "Coal")),
    "Hood [1]": InStoreItem(price: 21_000, count: 1, item: Item(name: "Hood [1]"))
  ]
  
  func sell(name: String, zeny: Int) throws -> Item {
    
    var depositedZeny = zeny
    
    guard let item = itemsList[name] else {
      throw ShopError.wrongItem
    }
    
    guard item.price <= zeny else {
      throw ShopError.needMoreZeny(zenyNeeded: item.price - zeny)
    }
    
    depositedZeny -= item.price
    var newItem = item
    newItem.count -= 1
    itemsList[name] = newItem
    
    return newItem.item
  }
}

let merchantShop = littleMerchantShop()

do {
  try merchantShop.sell(name: "Muffler", zeny: 7536)
} catch ShopError.wrongItem {
  "Нету у нас такого товара, товарищ!"
} catch ShopError.needMoreZeny(let zenyNeeded) {
  "Не хватает \(zenyNeeded) zeny"
}

do {
  try merchantShop.sell(name: "Hood [1]", zeny: 7536)
} catch ShopError.wrongItem {
  "Нету у нас такого товара, товарищ!"
} catch ShopError.needMoreZeny(let zenyNeeded) {
  "Не хватает \(zenyNeeded) zeny"
}
//: Можно упростить схему обработки ошибки до получения пустого (**nil**) значения в случае ошибки.
let sell = try? merchantShop.sell(name: "Coal", zeny: 11)

//: ### Домашнее задание
//: Опробуйте в деле возможности Try / Catch

//: [Вперёд](@next)
