//: [Назад](@previous)
import Foundation
//: ## Error
//: В языке **Swift** существует несколько *встроенных* технических протоколов. Одним из них является протокол **Error**, применяемый к *Перечислениям*.
enum HealingError: Error {
  case alreadyDead // Персонаж уже преставился.
  case undeadElement // В броне мертвеца лечение ему не пойдёт на пользу, ага.
}

class Player {
  var hp: Int
  var element: String
  
  init(hp: Int, element: String) {
    self.hp = hp
    self.element = element
  }
}

class Priest {
  func heal(player: inout Player) -> (Player?, HealingError?) {
    
    guard player.hp > 0 else {
      return (nil, HealingError.alreadyDead)
    }
    
    guard player.element != "Undead" else {
      player.hp += 100
      return (nil, HealingError.undeadElement)
    }
    return (player, nil)
  }
}

var deadHero    = Player(hp: 0, element: "Water")
var undeadHero  = Player(hp: 777, element: "Undead")
let priest      = Priest()

let healAlreadyDeadPersonResult = priest.heal(player: &deadHero)
let healUndeadPerson = priest.heal(player: &undeadHero)

if let _ = healAlreadyDeadPersonResult.0 {
  print("Вылечил братуху")
} else if let error = healAlreadyDeadPersonResult.1 {
  print("Ошибочка вышла: Клиент \(error)")
}
//: ### Домашнее задание
//: Попрактикуйтесь в применении протокола **Error**

//: [Вперёд](@next)
