import Foundation
import SwiftyJSON
import RealmSwift
import Magic

/// Монстр
class Monster: Object {
  @objc dynamic var name = ""
  @objc dynamic var level = 1
  @objc dynamic var location: Location?
  @objc dynamic var hp = 1
  @objc dynamic var atk = 1
}
