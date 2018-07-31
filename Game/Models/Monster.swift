import Foundation
import Magic
import SwiftyJSON
import RealmSwift

class Monster: Object {
  @objc dynamic var name = ""
  
  convenience init(json: JSON) {
    self.init()
    
    self.name = json["name"].stringValue
  }
}
