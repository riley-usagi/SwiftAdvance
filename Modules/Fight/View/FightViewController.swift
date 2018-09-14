import UIKit
import Reusable

final class FightViewController: UIViewController, FightViewInput, StoryboardSceneBased {
  
  @IBOutlet weak var monsterNameLabel: UILabel!
  
  static let sceneStoryboard = UIStoryboard(name: "FightModule", bundle: Bundle(for: FightViewController.self))
  
  var output: FightViewOutput!
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    output.viewIsReady()
  }
  
  // MARK: FightViewInput
  func setupInitialState() {
  }
}
