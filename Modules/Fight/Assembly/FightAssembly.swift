import Swinject
import SwinjectStoryboard

class FightModuleAssembly: Assembly {
  
  func assemble(container: Container) {
    container.register(FightInteractor.self) { (r, presenter: FightPresenter) in
      let interactor = FightInteractor()
      interactor.output = presenter
      
      return interactor
    }
    
    container.register(FightRouter.self) { (r, viewController: FightViewController) in
      let router = FightRouter()
      router.transitionHandler = viewController
      
      return router
    }
    
    container.register(FightPresenter.self) { (r, viewController: FightViewController) in
      let presenter = FightPresenter()
      presenter.view = viewController
      presenter.interactor = r.resolve(FightInteractor.self, argument: presenter)
      presenter.router = r.resolve(FightRouter.self, argument: viewController)
      
      return presenter
    }
    
    container.storyboardInitCompleted(FightViewController.self) { r, viewController in
      viewController.output = r.resolve(FightPresenter.self, argument: viewController)
    }
  }
}
