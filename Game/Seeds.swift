import Foundation
import RealmSwift
import Magic

var heroes: [Hero] = [Hero()]

/// Удаление базы данных и создание новых записей
struct Seeds {
  
  func reInit() {

    let startedLocation = Location()
    startedLocation.name = "prt_field08"
    
    let riley   = Hero()
    riley.name  = "Riley"
    riley.level = 18
    riley.str   = 17
    riley.agi   = 11
    riley.currentHeroLocation = startedLocation
    
    let djaflienda    = Hero()
    djaflienda.name   = "Djaflienda"
    djaflienda.level  = 14
    djaflienda.str    = 22
    djaflienda.agi    = 12
    djaflienda.currentHeroLocation = startedLocation
    
    heroes = [riley, djaflienda]
    
    
    do {
      try realm.write {
        realm.deleteAll()
        magic("Database cleared")
        realm.add(startedLocation)
        realm.add(heroes)
      }
    } catch {
      magic(error)
    }
    
  }
}


