import Foundation
import SwiftKeychainWrapper

/// Класс Игрока. Поскольку это так называемый "Одиночка" (singletone) - он доступен по всему приложению (как объект Сессии, к примеру)
class Player {
  // Делаем конструктор приватным. Это запретит создание экземпляров класса. То есть - делает его Одиночкой (синглтоном).
  private init() {}
  
  // Класс сам в себе хранит свой же единственный объект.
  static let shared = Player()
  
  var id: String? = KeychainWrapper.standard.string(forKey: "userId")
  var heroes: [Hero]?
  var currentHero: Hero?
}
