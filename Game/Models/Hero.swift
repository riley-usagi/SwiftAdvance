import Foundation
import Magic
import RealmSwift

/// Персонаж пользователя
class Hero: Object {
  @objc dynamic var name: String  = ""
  @objc dynamic var level: Int    = 1
  @objc dynamic var str: Int      = 1

}

//class Monster: Object {
//  @objc dynamic var name = ""
//  
//  convenience init(json: JSON) {
//    self.init()
//    
//    self.name = json["name"].stringValue
//  }
//}
