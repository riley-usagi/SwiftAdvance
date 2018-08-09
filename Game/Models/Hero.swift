import Foundation
import Magic
import RealmSwift
import Fakery

let faker = Faker()

/// Персонаж пользователя
class Hero: Object {
  
  // Информация о пользователе
  @objc dynamic var id: String   = UUID().uuidString
  @objc dynamic var level: Int   = 1
  @objc dynamic var str: Int     = 1
  @objc dynamic var heroLocation: String      = "prt_field08"
  //@objc dynamic var currentHeroLocation: Location
//  var locations = List<Location>()
  @objc dynamic var name: String = "" {
    didSet {
      if oldValue == "" {
        // Генерируем случайное имя благодаря сторонней библиотеке
        self.name = faker.name.firstName()
      }
    }
  }
  
  override static func primaryKey() -> String? {
    return "id"
  }
}
