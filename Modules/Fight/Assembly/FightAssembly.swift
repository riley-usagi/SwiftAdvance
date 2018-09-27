import Swinject
import SwinjectStoryboard

/// Сборщик модуля - FightModule
class FightModuleAssembly: Assembly {
  
  /// Процесс сборки зависимостей
  ///
  /// - Parameter container: Контейнер для Сервисов и Фабриков
  func assemble(container: Container) {
    
    // Регистрируем в контейнере Представителя для Интерактора
    container.register(FightInteractor.self) { (r, presenter: FightPresenter) in
      let interactor    = FightInteractor()
      interactor.output = presenter
      
      return interactor
    }
    
    // Регистрируем в контейнере Экран для Роутера
    container.register(FightRouter.self) { (r, viewController: FightViewController) in
      let router                = FightRouter()
      router.transitionHandler  = viewController
      
      return router
    }
    
    // Регистрируем в контейнере Экран, Интерактора и Роутер для Представителя
    container.register(FightPresenter.self) { (r, viewController: FightViewController) in
      let presenter         = FightPresenter()
      presenter.view        = viewController
      presenter.interactor  = r.resolve(FightInteractor.self, argument: presenter)
      presenter.router      = r.resolve(FightRouter.self, argument: viewController)
      
      return presenter
    }
    
    // Привязываем Представителя к сториборду текущего Модуля
    container.storyboardInitCompleted(FightViewController.self) { r, viewController in
      viewController.output = r.resolve(FightPresenter.self, argument: viewController)
    }
    
  }
}
