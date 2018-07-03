//: [Назад](@previous)
import Foundation
//: ## Extension
//: *Расширения* нельзя описать и где-то применять. При помощи *Расширений* мы можешь лишь добавлять поведение существующим *Классам* не меняя их нынешнюю функциональность.
/*:
 > *Расширения* могут добавлять только:
 > 1. Методы
 > 2. Вспомогательные конструкторы *(инициализаторы)*
 > 3. Вычисляемые свойства
 */
protocol Novice {
  var hp: Int { get set }
  init(hp: Int)
  func firstAid ()
}

protocol Merchant {
  func identify(item: String)
}

class Hero {
  required init(hp: Int) {
    self.hp = hp
  }
}
//: > Ещё один важный момент: Одно из главных преимуществ *Расширений* заключается в возможности группировать *Протоколы*
extension Hero: Novice, Merchant {
  var hp: Int {
    get { return self.hp }
    set {}
  }

  func firstAid() {
    hp += 10
  }
  
  func identify(item: String) {
    print("Так это ж \(item)!")
  }
}

var hero = Hero(hp: 77)
hero.firstAid()
hero.identify(item: "Knife")
//: ### Домашнее задание
//: Попробуйте создать несколько протоколов и имплементировать их *Классу* через расширение. Затем проверьте работоспособность данной конструкции.

//: [Вперёд](@next)
