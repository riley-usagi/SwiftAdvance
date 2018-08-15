import Foundation
import Magic
import SwiftyJSON
import RealmSwift

/// Монстр
class Monster: Object {
  @objc dynamic var name = ""
  @objc dynamic var level = 1
  @objc dynamic var location: Location?
//  var locations = List<Location>()
//  let locations = LinkingObjects(fromType: Location.self, property: "location")
}
