import UIKit
import Reusable
import Magic

final class FightViewController: UIViewController, StoryboardSceneBased {
  
  @IBOutlet weak var monsterNameLabel: UILabel!
  
  static let sceneStoryboard = UIStoryboard(name: "FightModule", bundle: Bundle(for: FightViewController.self))
  
  var output: FightViewOutput!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    output.viewIsReady()
  }
  
  func setupInitialState() {
    show(content: "Poring!!")
  }
}

extension FightViewController: FightViewInput {
  func show(content: String) {
    monsterNameLabel.text = content
  }
}
