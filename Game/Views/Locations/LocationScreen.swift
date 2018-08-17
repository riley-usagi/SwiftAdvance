import UIKit
import Magic

class LocationScreen: UIViewController {
  
  @IBOutlet weak var locationName: UILabel!
  @IBOutlet weak var mapSelect: UIButton!
  
  var location: Location?

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    magic(location)
    locationName.text = location?.name
  }
}
