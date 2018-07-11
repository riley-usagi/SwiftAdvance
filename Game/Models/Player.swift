import Foundation

class Player {
  // Делаем конструктор приватным. Это запретит создание экземпляров класса. То есть - делает его Одиночкой (синглтоном).
  private init() {}
  
  // Класс сам в себе хранит свой же единственный объект.
  static let player = Player()
  
  var name: String  = "Riley"
  var atk: Int      = 77
  var str: Int      = 5
}
