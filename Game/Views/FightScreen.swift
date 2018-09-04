import UIKit
import Magic
import Alamofire
import RealmSwift
import RAMAnimatedTabBarController

/// Экран битвы
class FightScreen: UIViewController {
  
  @IBOutlet weak var monsterName: UILabel!
  @IBOutlet weak var monsterLevel: UILabel!
  @IBOutlet weak var monsterHp: UILabel!
  @IBOutlet weak var monsterHpProgressBar: UIProgressView!
  @IBOutlet weak var fightTabBarItem: RAMAnimatedTabBarItem!
  
//  var monsters = [Monster]()

  var timer = Timer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    let monsters = realm.objects(Monster.self)
    let randomMonster = monsters.randomItem()
    
    let operationQueue = OperationQueue()
    
    let monsterFightOperation = MonsterFightOperation()
    let heroFightOperation    = HeroFightOperation(monsterFightOperation: monsterFightOperation, currentMonster: randomMonster)
//    monsterFightOperation.heroFightOperation = heroFightOperation
    
    operationQueue.addOperation(heroFightOperation)
//    operationQueue.addOperation(monsterFightOperation)
    

    // MARK: Timer and progressbar
    
    // timer = Timer.scheduledTimer(timeInterval: TimeInterval(player.atkDelay), target: self, selector: #selector(FightScreen.updateProgressView), userInfo: nil, repeats: true)
    
    // monsterHpProgressBar.setProgress(1.0, animated: false)
     
    // SwiftyJsonMonstersService().allMonsters() { [weak self] jsonMonsters in
    // self?.monsters = jsonMonsters
    // self?.monsterName.text = self?.monsters.last?.name
    // }
    
  }
  
  @objc func updateProgressView() {}
}
