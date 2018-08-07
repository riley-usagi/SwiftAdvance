import Foundation
import Magic
import RealmSwift

/// Персонаж пользователя
class Hero: Object {

  /// Набор случайных имён для персонажа, если пользователь его не ввел самомстоятельно
  let arrayOfDefaulNames = ["Akira", "Kichi", "Mihoko", "Orino", "Shika"]
  
  // Информация о пользователе
  @objc dynamic var id: String        = ""
  @objc dynamic var level: Int        = 1
  @objc dynamic var str: Int          = 1
  @objc dynamic var location: String  = "prt_field08" 
  @objc dynamic var name: String      = "" {
    didSet {
      if oldValue == "" {
        self.name = arrayOfDefaulNames[Int(arc4random_uniform(5) + 0)]
      }
    }
  }
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
//  func incrementID() -> Int {
//    let realm = try! Realm()
//    return (realm.objects(Hero.self).max(ofProperty: "id") as Int? ?? 0) + 1
//  }
}
