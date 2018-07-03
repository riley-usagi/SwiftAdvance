//: [Назад](@previous)
import Foundation
//: ## Generic
//: Дженерики являют собой один из самых мощных инструментов языка программирования Swift.
//: Суть дженерика заключается в том, что в нём можно описать поведение, которое можно применять к различным типам данных.
//: Обозначение `<T>` указывает на то, что это динамический тип. Или так же можно сказать - *заранее неизвестный тип данных*
/// Оружие как таковое. Может быть одним из нескольких типов (мечи, ножи, луки и так далее)
struct Weapons<T> {
  var items: [T] = []
  
  mutating func push(_ item: T) {
    items.append(item)
  }
}

protocol Named {
  var name: String { get set }
  
  init(name: String)
}

/// Мечи
class Sword: Named {
  var name: String
  
  required init(name: String) {
    self.name = name
  }
}

/// Луки
class Bow: Named {
  var name: String
  
  required init(name: String) {
    self.name = name
  }
}

var bows    = Weapons<Bow>()
var swords  = Weapons<Sword>()

var shootingStar    = Bow(name: "Shooting Star")
var immaterialSword = Sword(name: "Immaterial Sword")

bows.push(shootingStar)
swords.push(immaterialSword)

bows.items
swords.items
//: ### Домашнее задание
//: Попробуйте свои силы в созданиие новых Дженериков.

//: [Вперёд](@next)
