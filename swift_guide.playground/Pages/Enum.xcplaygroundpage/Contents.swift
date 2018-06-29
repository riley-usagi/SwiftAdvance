//: [Previous](@previous)

import Foundation

// =================================================================================
// =========================== Enum (перечисление) =================================
// =================================================================================

// Enum - ещё один тип данных. Он предназначен для создания и ранения простых констант.

enum Elements: String {
  case fire, earth, wind, water
}

func translatedElement(element: Elements) {
  switch element {
  case .earth:
    print("Земля")
  case .fire:
    print("Огонь")
  case .wind:
    print("Ветер")
  case .water:
    print("Вода")
  }
}

translatedElement(element: .wind)
print("\n===========\n")
// =================================================================================
// =========================== Перечисления со значениями ==========================
// =================================================================================

enum RawElement: String {
  case fire   = "Fire"
  case earth  = "Earth"
  case wind   = "Wind"
  case water  = "Water"
}
let weapon: String = "Katana"

func enchant(weapon: String, element: RawElement) -> String {
  // Мы используем метод rawValue для доступа к значению перечисления.
  return element.rawValue + " " + weapon
}

print(enchant(weapon: weapon, element: .fire))
print("\n===========\n")
// =================================================================================
// =========================== Связанные значения ==================================
// =================================================================================

// Довольно сложная для понимания конструкция языка,
// к осмыслению которой вы можете придти далеко не сразу.

// Суть перечислений со связными значениями заключается в том,
// что вы можете передавать данные напрямую в варианты перечисления для дальнейшего использования.

/// Перечисления качества какого-либо места с указанием затрат стрел и качеством смертей в час времени.
enum PlaceQuality {
  case bad(place: String, exp: Int)
  case normal(place: String, exp: Int)
  case good(place: String, exp: Int)
}

/// Функция расчитывающая варианты для подходящей площадки для получения максимального опыта
func experienceCalculation(place: String, arrows: Int, deaths: Int) -> PlaceQuality {
  
  if (arrows >= 1000 && deaths >= 100) {
    return .bad(place: place, exp: 247)
  } else if (arrows <= 100 && deaths <= 10) {
    return .good(place: place, exp: 7242)
  } else {
    return .normal(place: place, exp: 456)
  }
}

let payField08: PlaceQuality = experienceCalculation(place: "pay_field08", arrows: 745, deaths: 2)

switch payField08 {
case let .good(place, exp):
  print(place, "- нормальное место. Нарубал тут себе аж", exp, "опыта.")
case .bad(let place, let exp):
  print(place, "точно не лучший выбор. Здесь клёва нет. Всего \(exp) за час.")
case .normal(let place, let exp):
  print(place, "сойдёт. Собрал здесь \(exp) опыта.")
}

// =================================================================================
// =========================== Домашнее задание ====================================
// =================================================================================

// Создайте несколько примеров используя полученные знания.

//: [Next](@next)
