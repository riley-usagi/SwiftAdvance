import Foundation
import Magic
import RealmSwift

/// Локация на которой находятся монстры и на которой может находиться игрок
class Location: Object {
  @objc dynamic var name: String = ""
  // @objc dynamic var hero: Hero?
  // TODO: Добавить монстров на локацииЯ взял по примеру из документации и создал связку Hero has_many Location(s)
}
