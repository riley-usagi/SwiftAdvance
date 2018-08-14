import UIKit
import Magic
import RAMAnimatedTabBarController

class SettingsList: UITableViewController {
  
  @IBOutlet weak var settingsTabBarItem: RAMAnimatedTabBarItem!
  
  @IBOutlet weak var currentHeroCell: UITableViewCell!
  @IBOutlet weak var currentHeroLocationCell: UITableViewCell!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Вывод информации о текущем герое. Профессия и уровень.
    currentHeroCell.detailTextLabel?.text = "Такая-то профессия и уровень" 
    //currentHeroCell.detailTextLabel?.text = characterDetails(name: Player.player.currentHero?.name, location: Player.player.currentHero?.currentHeroLocation?.name)
    
    // Информация о текущей локации героя
    currentHeroLocationCell.detailTextLabel?.text = locationDetails(location: Player.player.currentHero?.currentHeroLocation?.name)
  }
  
  func characterDetails(name: String?, location: String?) -> String {
    guard !(name == nil) && !(location == nil) else {
      return ""
    }
    return String("\(String(describing: name!)) - \(String(describing: location!))")
  }
  
  func locationDetails(location: String?) -> String {
    guard !(location == nil) else {
      return ""
    }
    return String("\(String(describing: location))")
  }
}
