import Foundation
import RealmSwift

let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
let realm = try! Realm(configuration: config)


@objcMembers class Monster: Object {
  dynamic var name: String = ""
  dynamic var level: Int = 0
  dynamic var hp: Int = 0
  let atkDelay = RealmOptional<Float>()
  
  convenience init(name: String, level: Int, hp: Int, atkDelay: Float?) {
    self.init()
    self.name   = name
    self.level  = level
    self.hp     = hp
    self.atkDelay.value = atkDelay
  }
}




public struct MonsterOld {
  
  /// Раса монстра
  public enum Race: String {
    case plant = "Растение"
    case undead = "Нежить"
  }
  
  /// Природный элемент монстра
  public enum Property {
    case holy, poison
  }
  
  /// Размер монстра
  public enum Size {
    case small, medium, large
  }
  
  /// Имя монстра
  public var name: String
  public var level: Int
  public var hp: Int
  public var race: String
  public var property: (Property, Int)
  public var size: Size
  public var aggressive: Bool
  public var hit: Int
  public var flee: Int
  public var baseExp: Int
  public var jobExp: Int
  public var atkDelay: Float
  public var atk: Int
  public var def: Int
  public var mDef: Int
  public var str: Int
  public var int: Int
  public var agi: Int
  public var vit: Int
  public var dex: Int
  public var luk: Int
  
  public init() {
    self.name       = "Santa Poring"
    self.hp         = 69
    self.level      = 3
    self.race       = Race.plant.rawValue
    self.property   = (Property.holy, 1)
    self.size       = Size.small
    self.aggressive = false
    self.hit        = 37
    self.flee       = 90
    self.baseExp    = 4
    self.jobExp     = 5
    self.atkDelay   = 1.67
    self.atk        = Int(arc4random_uniform(5) + 12)
    self.def        = 0
    self.mDef       = 0
    self.str        = 1
    self.int        = 10
    self.agi        = 14
    self.vit        = 3
    self.dex        = 12
    self.luk        = 90
  }
}
