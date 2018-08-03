import Foundation

/// Локация на которой находятся монстры и на которой может находиться игрок
class Location {
  var name: String
  var monsters: [Monster]
  
  init(locationName: String, monstersOnMap: [Monster]) {
    self.name     = locationName
    self.monsters = monstersOnMap
  }
}
