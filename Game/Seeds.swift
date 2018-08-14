import Foundation
import RealmSwift
import Magic


var heroes: [Hero] = [Hero()]

/// Удаление базы данных и создание новых записей
struct Seeds {
  
  func reInit() {
    
    let riley = Hero()
    riley.name = "Riley"
    riley.str = 17
    riley.agi = 11
    
    let djaflienda = Hero()
    djaflienda.name = "Djaflienda"
    djaflienda.str = 22
    djaflienda.agi = 12
    
    heroes = [riley, djaflienda]
    
    try! realm.write {
    }
    magic("Database cleared")
    
    do {
      try realm.write {
        realm.deleteAll()
        realm.add(heroes)
      }
    } catch {
      magic(error)
    }
    
  }
}


