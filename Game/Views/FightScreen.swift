import UIKit
import Magic
import Alamofire
import RAMAnimatedTabBarController

class FightScreen: UIViewController {
  
  @IBOutlet weak var monsterName: UILabel!
  @IBOutlet weak var monsterLevel: UILabel!
  @IBOutlet weak var monsterHp: UILabel!
  @IBOutlet weak var monsterHpProgressBar: UIProgressView!
  @IBOutlet weak var fightTabBarItem: RAMAnimatedTabBarItem!
  
  var monsters = [Monster]()
  var player = Player.player
  var poring = ("Poring", 1, 500)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //    SwiftyJsonMonstersService().allMonsters() { [weak self] jsonMonsters in
    //      self?.monsters = jsonMonsters
    //      self?.monsterName.text = self?.monsters.last?.name
    //    }
    
  }
}
