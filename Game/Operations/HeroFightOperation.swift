import Foundation
import Magic

class HeroFightOperation: AsyncOperation {
 
  var monsterFightOperation: AsyncOperation?
  var monsterHp: Int = 0
  var monsterAtk: Int = 0
  var hero: Hero = Player.shared.currentHero!
  
  convenience init(monsterFightOperation: AsyncOperation, currentMonster: Monster) {
    self.init()
    self.monsterFightOperation  = monsterFightOperation
    self.monsterHp = currentMonster.hp
    self.monsterAtk = currentMonster.atk
  }
  
  override func start() {
    magic("Hero attack!")

//    while monsterHp > 0 && !(monsterFightOperation?.isFinished)! {
//      monsterHp -= hero.atk
//      magic("monster hp is \(String(describing: monsterHp))")
//      sleep(1)
//    }
    
    self.state = .isFinished
  }
}
