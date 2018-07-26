import Foundation
import Realm
import RealmSwift

let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
let realm = try! Realm(configuration: config)

@objcMembers class Monster: Object, Decodable {
  dynamic var id: Int       = 0
  dynamic var name: String  = ""
  //  dynamic var level: Int    = 0
  dynamic var hp: Int       = 0
  dynamic var atk: Int      = 0
  //  let atkDelay              = RealmOptional<Float>()
  
  /// Первичный ключ
  override static func primaryKey() -> String? {
    return "id"
  }
  
  private enum MonsterCodingKeys: String, CodingKey {
    case id
    case name
    case level
    case hp
    case atk
  }
  
  convenience init(id: Int, name: String, hp: Int, atk: Int) {
    self.init()
    self.id     = id
    self.name   = name
    //    self.level  = level
    self.hp     = hp
    self.atk    = atk
    //    self.atkDelay.value = atkDelay
  }
  
  convenience required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MonsterCodingKeys.self)
    let id        = try container.decode(Int.self, forKey: .id)
    let name      = try container.decode(String.self, forKey: .name)
    //    let level     = try container.decode(Int.self, forKey: .level)
    let hp        = try container.decode(Int.self, forKey: .hp)
    let atk       = try container.decode(Int.self, forKey: .atk)
    self.init(id: id, name: name, hp: hp, atk: atk)
  }
  
  required init() {
    super.init()
  }
  
  required init(value: Any, schema: RLMSchema) {
    super.init(value: value, schema: schema)
  }
  
  required init(realm: RLMRealm, schema: RLMObjectSchema) {
    super.init(realm: realm, schema: schema)
  }
}
