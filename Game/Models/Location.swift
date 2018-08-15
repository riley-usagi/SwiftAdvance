import Foundation
import Magic
import RealmSwift

/// Локация на которой находятся монстры и на которой может находиться игрок
class Location: Object {
  @objc dynamic var name: String = ""
//  var monsters = List<Monster>()
  let monsters = LinkingObjects(fromType: Monster.self, property: "location")

}
