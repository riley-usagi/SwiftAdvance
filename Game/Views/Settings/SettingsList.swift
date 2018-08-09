import UIKit
import Magic
import RAMAnimatedTabBarController

class SettingsList: UITableViewController {
  
  @IBOutlet weak var settingsTabBarItem: RAMAnimatedTabBarItem!
  
  @IBOutlet weak var heroLocationCell: LocationCell!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Устанавливаем даные о текущем герое и его положении на карте
    heroLocationCell.textLabel?.text        = Player.player.currentHero?.name
    heroLocationCell.detailTextLabel?.text  = Player.player.currentHero?.heroLocation
  }
}
