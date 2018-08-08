import Foundation
import SwiftKeychainWrapper

/// Класс Игрока. Поскольку это так называемый "Одиночка" (singletone) - он доступен по всему приложению (как объект Сессии, к примеру)
class Player {
  // Делаем конструктор приватным. Это запретит создание экземпляров класса. То есть - делает его Одиночкой (синглтоном).
  private init() {}
  
  // Класс сам в себе хранит свой же единственный объект.
  static let player   = Player()
  
  var name: String    = "Riley"
  var atkDelay: Float = 1.27
  var atk: Int        = 77
  var str: Int        = 5
  var agi: Int        = 5
  var exp: Int        = 1
  var jExp: Int       = 1
  
  var currentLocation: String? = KeychainWrapper.standard.string(forKey: "playerCurrentLocation")
}
