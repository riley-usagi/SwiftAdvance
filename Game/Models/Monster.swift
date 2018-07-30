import Foundation
import Magic
import SwiftyJSON

class Monster {
  var name: String
  
  init(json: JSON) {
    magic(json["name"].stringValue)
    
    self.name = json["name"].stringValue
  }
}
