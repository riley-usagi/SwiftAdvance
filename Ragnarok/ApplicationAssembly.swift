import Swinject
import SwinjectStoryboard


/// Регистрация сборщиков
final class ApplicationAssembly {
  
  /// Список зарегистрированных сборщиков всех модулей
  class var assembler: Assembler {
    return Assembler([FightModuleAssembly()])
  }
  
  var assembler: Assembler
  
  /// Стандартный сборщик. Можно заменить своими.
  ///
  /// - Parameter assemblies: список сборщиков
  init(with assemblies: [Assembly]) {
    assembler = Assembler(assemblies)
  }
}


// MARK: - Передаче ассемблера между сторибордами
extension SwinjectStoryboard {
  @objc class func setup() {
    defaultContainer = ApplicationAssembly.assembler.resolver as! Container
  }
}
