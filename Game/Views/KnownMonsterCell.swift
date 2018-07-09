import UIKit

class KnownMonsterCell: UITableViewCell {
  
  @IBOutlet weak var monsterName: UILabel!
  @IBOutlet weak var monsterLevel: UILabel!
  
  
  func configure(with knownMonster: KnownMonster) {
    monsterName.text  = knownMonster.name
    monsterLevel.text = String(knownMonster.level)
  }
}
