import Foundation
import Magic

class MonsterFightOperation: AsyncOperation {
  
  var heroFightOperation: AsyncOperation?
  
  convenience init(heroFightOperation: AsyncOperation) {
    self.init()
    self.heroFightOperation = heroFightOperation
  }
  
  override func main() {
    magic("Monster attack!")
    
    var heroHp = 111
    let monsterAtk = 7
    
    while heroHp > 0 {
      heroHp -= monsterAtk
      magic("hero hp is \(heroHp)")
      sleep(1)
    }
    
    heroFightOperation?.cancel()
  }
}
