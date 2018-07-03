//: [Назад](@previous)
import Foundation
//: ## Generic

struct Weapons<T> {
  var items: [T] = []
  
  mutating func push(_ item: T) {
    items.append(item)
  }
}

class Knife {
  
}

class Sword {
  
}

class Mace {
  
}

class Bow {
  let name: String
  
  init(nme: String) {
    self.name = nme
  }
}

var bows = Weapons<Bow>()

var shootingStar = Bow(nme: "Shooting Star")

bows.push(shootingStar)

bows.items
//: ### Домашнее задание

//: [Вперёд](@next)
