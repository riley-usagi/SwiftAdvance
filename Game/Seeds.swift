import Foundation
import RealmSwift
import Magic



/// Удаление базы данных и создание новых записей
struct Seeds {
  func reInit() {
    
    try! realm.write {
      realm.deleteAll()
    }
    magic("Database cleared")
    
    let newHero   = Hero()
    newHero.name  = "Riley"
    newHero.str   = 17
    newHero.agi   = 11
    
    do {
      try realm.write {
        realm.add(newHero)
      }
    } catch {
      magic(error)
    }
    
  }
}


