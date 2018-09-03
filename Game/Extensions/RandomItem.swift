import Foundation

extension Collection {
  /// Случайный элемент коллекции
  ///
  /// - Returns: Элемент коллекции
  func randomItem() -> Self.Iterator.Element {
    let count = distance(from: startIndex, to: endIndex)
    let roll = Int.randomInteger(inRange: 0...count-1)
    return self[index(startIndex, offsetBy: roll)]
  }
}
