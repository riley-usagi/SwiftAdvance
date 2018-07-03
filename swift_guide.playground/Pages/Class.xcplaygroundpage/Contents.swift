//: [Назад](@previous)

import Foundation

//: ## Class
//: > Структуры и Классы во многом похожи. Однако существенные различия всё же есть. О них и поговорим ниже.
//: ### Ссылочный тип

/// Пример Структуры
struct MoonlightDagger {
  var element: String
}

var fireDagger  = MoonlightDagger(element: "Fire")
var waterDagger = MoonlightDagger(element: "Water")
//: Как видим - объекты имеют разные элементы, как это и было задумано.
print(fireDagger.element, waterDagger.element) // Fire Water
waterDagger = fireDagger
//: Присвоим значение одного объекта другому и убедимся в том, что их значения теперь идентичны.
print(fireDagger.element, waterDagger.element) // Fire Fire
//: Однако изменив значение у первого объекта - значение второго остаётся неизменным.
fireDagger.element = "Earth"
print(fireDagger.element, waterDagger.element) // Earth Fire
print("\n===========\n")
/*:
> Суть подобных преобразований заключается в том, что Структуры являются так называемым - Типом Значения.
 Это говорит о том, что в свойствах Структуры хранятся сами значения Структуры.
 После создания копии `(waterDagger = fireDagger)` мы лишь копируем значения одной Структуры в другую, при этом это всё ещё две разных Структуры, не смотря на их схожесть.
*/
//: В случае с же с Классами у нас всё несколько иначе.
/// Пример Класса
class Rapier {
  var element: String
  
  init(element: String) {
    self.element = element
  }
}

var windRapier  = Rapier(element: "Wind")
var earthRapier = Rapier(element: "Earth")

//: Пока что разница между Структурой и классом не видна
print(windRapier.element, earthRapier.element) // Wind Earth

earthRapier = windRapier
//: Присвоим значение одного объекта другому и убедимся в том, что их значения теперь идентичны.
print(windRapier.element, earthRapier.element) // Wind Wind

windRapier.element = "Water"

/*:
> Вот здесь мы уже видим разницу. Изменив значение одного объекта - так же изменился и другой.
Это означает, что в переменной хранится не само значение, как в случае со Структурами, а лишь ссылка на него.
Если в случае с копированием Стуруктур мы имели разные структуры, как клоны, то в Случае с Классами они становятся единым объектом с доступом к нему по ссылке.
print(windRapier.element, earthRapier.element) // Water Water
*/
print("\n===========")

//: ### Свойства и методы

/// Ножи, которые куёт кузнец
class Knife {
  static var count: Int = 0
  
  init() {
    Knife.count += 1
  }
  
  static func knifesCount() {
    print("Наковал себе \(self.count) ножа. Доволен, ага.")
  }
}

let firstKnife  = Knife()
let secondKnife = Knife()
let thirdKnife  = Knife()

Knife.count

Knife.knifesCount()

print("\n===========")

//: ### Вспомогательный конструктор
/*:
 В отличие от обязательного конструктора `init() {}` в случае с Классами мы можем добавлять ещё и необязательные вспопогательные конструкторы.
 Суть вспомогательных конструкторов (инициализаторов) заключается в том... чтобы помогать с созданием часто создаваемых объектов Класса.
*/

/// Новичок. Может использоваться со стандартными статами для хранения всякого барахла в инвентаре.
class Novice {
  var str, agi, vit, int, dex, luk: Int
  
  init(str: Int, agi: Int, vit: Int, int: Int, dex: Int, luk: Int) {
    self.str = str
    self.agi = agi
    self.vit = vit
    self.int = int
    self.dex = dex
    self.luk = luk
  }
  
  convenience init(defultValue: Int) {
    // Вспомогательный инициализатор обязан вызывать основной
    self.init(str: defultValue, agi: defultValue, vit: defultValue, int: defultValue, dex: defultValue, luk: defultValue)
  }
}

//: Создаём персонажа со стандартными статами, экономя время.
let trashNovice = Novice(defultValue: 5)
//: ### Наследование
/*:
 Случается порой такое, что необходимо сделать несколько версий одного объекта.
 Но копировать код из Класса в Класс с минимальными изменениями не есть хорошо.
 Специально для таких случаев существует механизм *Наследования*
*/
//: Для начала создаём основной Класс, от которого в дальнейшем будем *наследоваться*
/// Копьё
class Lance {
  var atk: Int
  var level: Int
  
  init(attack: Int, lvl: Int) {
    self.atk    = attack
    self.level  = lvl
  }
}
//: Затем создаём новый Класс, который получает копирует все свойства и методы родителя. При этом ему можно дописать и собственную функциональность.
/// Огненное копьё
class FireLance: Lance {
  enum Element {
    case fire, wind, water, earth
  }
  var element: Element
  
  // Собственный инициализатор, добавляющий новое свойство.
  init(elmnt: Element) {
    self.element = elmnt
    
    /*
     В случае наследования мы просто обязаны вызывать в новом инициализаторе - инизиализатор родителя.
     Делается это через ссылку - super.
     Ссылка super позразумевает вызов инициалиатора (в данном случае) *родительского* Класса.
     Так же через super можно обращаться к методам и свойствам *родительского* Класса.
    */
    super.init(attack: 185, lvl: 3)
  }
}

let fireLance = FireLance(elmnt: .fire)
//: В случае с наследованием вы можете использовать наследование бесконечное количество раз. Наследовать Класс от Класса и так без конца.
class RefinedFireLance: FireLance {
  var refinedRate: Int
  
  init (rfndRte: Int) {
    self.refinedRate = rfndRte
    super.init(elmnt: .fire)
  }
}

let fireLancePlus3 = RefinedFireLance(rfndRte: 3)
//: > Случается такое, что вам необходим отклчить возможность наследования от Класса. Делается это довольно просто.
//: Всё что вам необходимо - это добавить ключевое слово `final` перед объявлением класса.
//: Если бы мы написали `final Lance {}` мы уже не смогли бы создать классы `FireLance` и `RefinedFireLance`

//: ### Деиницилизация
//: > Вот личие от Структур, у Классов помимо *конструкторов* есть ещё и *деструкторы*.
//: *Деструктор* не удалает объект из памяти. Этм занимается сама среда выполнения. *Деструктор* лишь вызывается в момент удаления объекта из памяти.
/// Бутыль с синей магической жидкостью
class BluePotion {
  var action: String = "Восстанавливает очки SP"
  
  // Вызовется, когда объект будет удалён из памяти
  deinit {
    print("Выпил бутылочку...")
  }
}
// Варим новый отвар из трав
var boiledBluePotion: BluePotion? = BluePotion()

// Выпиваем бутыль и она *исчезает из памяти приложения*
boiledBluePotion = nil
//: ### Домашнее задание
//: Опробуйте все полученные в уроке возможности ООП.
//: [Вперёд](@next)
