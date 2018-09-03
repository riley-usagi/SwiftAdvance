import Foundation
import Magic

class HeroFightOperation: AsyncOperation {
 
  var monsterFightOperation: AsyncOperation?
  var currentMonster: Monster?
  
  convenience init(monsterFightOperation: AsyncOperation, currentMonster: Monster) {
    self.init()
    self.monsterFightOperation = monsterFightOperation
    self.currentMonster = currentMonster
  }
  
  override func start() {
    magic("Hero attack!")
    
    var monsterHp = 34
    let heroAtk = 9
    
    while monsterHp > 0 && !(monsterFightOperation?.isFinished)! {
      monsterHp -= heroAtk
      magic("monster hp is \(monsterHp)")
      sleep(1)
    }
    
    self.state = .isFinished
  }
}
