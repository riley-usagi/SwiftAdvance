import Foundation
import Magic

class HeroFightOperation: AsyncOperation {
 
  var monsterFightOperation: AsyncOperation?
  
  convenience init(monsterFightOperation: AsyncOperation) {
    self.init()
    self.monsterFightOperation = monsterFightOperation
  }
  
  override func main() {
    magic("Hero attack!")
    
    var monsterHp = 55
    let heroAtk = 7
    
    while monsterHp > 0 {
      monsterHp -= heroAtk
      magic("monster hp is \(monsterHp)")
      sleep(1)
    }
    
    monsterFightOperation?.cancel()
  }
}
