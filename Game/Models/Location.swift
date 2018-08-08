import Foundation
import Magic
import RealmSwift

/// Локация на которой находятся монстры и на которой может находиться игрок
class Location: Object {
  @objc dynamic var name: String = ""
  @objc dynamic var hero: Hero?
  // TODO: Добавить монстров на локации
  
}
