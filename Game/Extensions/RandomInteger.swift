import Foundation

extension Int {
  /// Функция возвращающая случайное число в указанном диапазоне
  ///
  /// - Parameter range: Диапазон
  /// - Returns: Случайное число в заранее заданном диапазоне
  static public func random<T : SignedInteger>(inRange range: ClosedRange<T> = 1...999999999) -> T {
    let length = Int64(range.upperBound - range.lowerBound + 1)
    let value = Int64(arc4random()) % length + Int64(range.lowerBound)
    return T(value)
  }
}
