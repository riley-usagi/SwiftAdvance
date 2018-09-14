import Swinject
import SwinjectStoryboard

final class ApplicationAssembly {
  
  //Use default dependency
  class var assembler: Assembler {
    return Assembler([FightModuleAssembly()])
  }
  
  var assembler: Assembler
  
  //If you want use custom Assembler
  init(with assemblies: [Assembly]) {
    assembler = Assembler(assemblies)
  }
}

//Inject dependency in Main Storyboard
extension SwinjectStoryboard {
  
  @objc class func setup() {
    defaultContainer = ApplicationAssembly.assembler.resolver as! Container
  }
}
