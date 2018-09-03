import Foundation
import RealmSwift
import Magic


/// Удаление базы данных и создание новых записей
struct Seeds {
  
  /// Пересоздание базы
  func reInit() {

    let startedLocation   = Location()
    startedLocation.name  = "prt_field08"
    
    var monsters: [Monster]
    
    let poring      = Monster()
    poring.name     = "Poring"
    poring.level    = 1
    poring.location = startedLocation
    poring.hp       = 50
    poring.atk      = Int.random(inRange: 8...9)
    
    let pupa      = Monster()
    pupa.name     = "Pupa"
    pupa.level    = 2
    pupa.location = startedLocation
    pupa.hp       = 427
    pupa.atk      = 0
    
    let lunatic       = Monster()
    lunatic.name      = "Lunatic"
    lunatic.level     = 3
    lunatic.location  = startedLocation
    lunatic.hp        = 60
    lunatic.atk       = Int.random(inRange: 11...12)
    
    let drops       = Monster()
    drops.name      = "Drops"
    drops.level     = 3
    drops.location  = startedLocation
    drops.hp        = 55
    drops.atk       = Int.random(inRange: 12...13)
    
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


