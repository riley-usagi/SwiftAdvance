import Foundation
import Magic
import RealmSwift

/// Персонаж пользователя
class Hero: Object {
    
  //рандомное имя для персонажа, если игрок его не ввел самомстоятельно
  let arrayOfDefaulNames = ["Akira", "Kichi", "Mihoko", "Orino", "Shika"]
  @objc dynamic var name: String  = "" {
    didSet {
      if oldValue == "" {
        self.name = arrayOfDefaulNames[Int(arc4random_uniform(5) + 0)]
      }
    }
  }
    
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
