import Foundation
import Magic

class HeroFightOperation: AsyncOperation {
 
  var monsterFightOperation: AsyncOperation?
  
  convenience init(monsterFightOperation: AsyncOperation) {
    self.init()
    self.monsterFightOperation = monsterFightOperation
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
