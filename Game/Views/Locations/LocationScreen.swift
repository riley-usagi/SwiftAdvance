import UIKit
import Magic

class LocationScreen: UIViewController {
  
  @IBOutlet weak var locationName: UILabel!
  
  /// Переносим текущего героя на выбранную локацию (из списка ему доступных)
  @IBAction func mapSelect(_ sender: Any) {
    Player.shared.currentHero?.currentHeroLocation = location
  }
  
  /// Текущая локация на экране
  var location: Location?

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  /// Выводим на экран необходимую информацию
  override func viewWillAppear(_ animated: Bool) {
    
    // TODO: Вывести список монстров на локации с возможностью просмотра конкретной карточки монстра
    locationName.text = location?.name
  }
}
