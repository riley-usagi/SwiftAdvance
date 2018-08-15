import Foundation
import RealmSwift
import Magic


/// Удаление базы данных и создание новых записей
struct Seeds {
  
  func reInit() {

    let startedLocation   = Location()
    startedLocation.name  = "prt_field08"
    
    var monsters: [Monster]
    
    let poring    = Monster()
    poring.name   = "Poring"
    poring.level  = 1
    poring.location = startedLocation
    
    let pupa      = Monster()
    pupa.name     = "Pupa"
    pupa.level    = 2
    pupa.location = startedLocation
    
    let lunatic   = Monster()
    lunatic.name  = "Lunatic"
    lunatic.level = 3
    lunatic.location = startedLocation
    
    let drops     = Monster()
    drops.name    = "Drops"
    drops.level   = 3
    drops.location = startedLocation
    
    monsters = [poring, pupa, lunatic, drops]
    
    var heroes: [Hero]

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
        realm.add(monsters)
        realm.add(startedLocation)
        realm.add(heroes)
      }
    } catch {
      magic(error)
    }
    
  }
}


