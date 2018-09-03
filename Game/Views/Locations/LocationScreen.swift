import UIKit
import Magic

class LocationScreen: UIViewController {
  
  @IBOutlet weak var locationName: UILabel!
  @IBAction func mapSelect(_ sender: Any) {
    magic("trying to change location")
  }
  
  var location: Location?

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    locationName.text = location?.name
  }
}
