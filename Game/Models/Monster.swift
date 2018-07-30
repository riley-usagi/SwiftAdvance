import Foundation
import Magic
import SwiftyJSON


let url = URL(string: "https://ragnarok-open-api.herokuapp.com/monsters")

class Monster {
  var id: Int
  var name = ""
  
  init(json: JSON) {
    self.id   = json["id"].intValue
    self.name = json["name"].stringValue
  }
}
