import UIKit

class MonsterCell: UITableViewCell {
  
  @IBOutlet weak var monsterName: UILabel!
  @IBOutlet weak var monsterLevel: UILabel!
  
  func configure(with monster: KnownMonster) {
    monsterName.text  = monster.name
    monsterLevel.text = "Level: \(monster.level)"
  }
}
