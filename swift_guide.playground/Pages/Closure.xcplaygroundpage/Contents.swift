//: [Назад](@previous)
import Foundation
//: ## Closure
//: **Замыкания** похожи на функции. Они так же принимают параметры и возвращают результат. Но на этом их схожесть заканчивается.
//: На самом деле **Замыкания** это анонимный блок кода не привязаный ни к чему.
//: **Замыкание** можно как хранить в переменных, так и передавать в качестве аргументов внуть методов.
//: > (типАргумента) -> типВозвращаемогоЗначения

class Player {
  var hp: Int
  var atk: Int
  
  init(hp: Int, atk: Int) {
    self.hp = hp
    self.atk = atk
  }
}

class Monster {
  var hp: Int
  var atk: Int
  
  init(hp: Int, atk: Int) {
    self.hp = hp
    self.atk = atk
  }
}

let fightClosure: (Player, Monster) -> Bool = { (player: Player, monster: Monster) -> Bool in
  
  let tmpHero = player
  let tmpMonster = monster
  
  while tmpHero.hp > 0 || tmpMonster.hp > 0 {
    tmpMonster.hp -= tmpHero.atk
    tmpHero.hp -= tmpMonster.atk
    if tmpHero.hp < 0 || tmpMonster.hp < 0 {
      break
    }
  }
  
  print("Player hp:", player.hp, ". Monster hp:", monster.hp)
  if tmpHero.hp > 0 || tmpMonster.hp > 0 {
    return true
  } else {
    return false
  }
}

func fightResult(player: Player, monster: Monster, fightResult: (Player, Monster) -> Bool) -> Bool {
  let result = fightResult(player, monster)
  return result
}

var hero    = Player(hp: 777, atk: 22)
var sleeper = Monster(hp: 333, atk: 11)

fightResult(player: hero, monster: sleeper, fightResult: fightClosure)

//: [Вперёд](@next)
