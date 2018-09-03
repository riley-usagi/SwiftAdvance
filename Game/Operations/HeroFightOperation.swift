import Foundation
import Magic

class HeroFightOperation: AsyncOperation {
 
  var monsterFightOperation: AsyncOperation?
  var currentMonster: Monster?
  var hero: Hero = Player.shared.currentHero!
  
  convenience init(monsterFightOperation: AsyncOperation, currentMonster: Monster) {
    self.init()
    self.monsterFightOperation  = monsterFightOperation
    self.currentMonster         = currentMonster
  }
  
  override func start() {
    magic("Hero attack!")

    while (currentMonster?.hp)! > 0 && !(monsterFightOperation?.isFinished)! {
      currentMonster?.hp -= hero.atk
      magic("monster hp is \(String(describing: currentMonster?.hp))")
      sleep(1)
    }
    
    self.state = .isFinished
  }
}
