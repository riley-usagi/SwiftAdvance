import UIKit
import Magic
import Alamofire
import RAMAnimatedTabBarController

/// Экран битвы
class FightScreen: UIViewController {
  
  @IBOutlet weak var monsterName: UILabel!
  @IBOutlet weak var monsterLevel: UILabel!
  @IBOutlet weak var monsterHp: UILabel!
  @IBOutlet weak var monsterHpProgressBar: UIProgressView!
  @IBOutlet weak var fightTabBarItem: RAMAnimatedTabBarItem!
  
  var monsters  = [Monster]()
  var player    = Player.player
  var poring    = ("Poring", 1, 500)
  
  var timer = Timer()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    timer = Timer.scheduledTimer(timeInterval: TimeInterval(player.atkDelay), target: self, selector: #selector(FightScreen.updateProgressView), userInfo: nil, repeats: true)
    
    monsterHpProgressBar.setProgress(1.0, animated: false)
    
    //    SwiftyJsonMonstersService().allMonsters() { [weak self] jsonMonsters in
    //      self?.monsters = jsonMonsters
    //      self?.monsterName.text = self?.monsters.last?.name
    //    }
    
  }
  
  @objc func updateProgressView() {
    if poring.2 > 0 {
      monsterHpProgressBar.progress = Float(poring.2) / Float(500)
      poring.2 -= player.atk
      magic(poring.2)
    }
  }
}
