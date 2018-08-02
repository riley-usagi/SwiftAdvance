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

  override func viewDidLoad() {
    super.viewDidLoad()
    
    fightTabBarItem.badgeValue = "17"
    
    SwiftyJsonMonstersService().allMonsters() { [weak self] jsonMonsters in
      
      self?.monsters = jsonMonsters
      
      self?.monsterName.text = self?.monsters.last?.name
    }
    
  }
  
  
  /*
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
