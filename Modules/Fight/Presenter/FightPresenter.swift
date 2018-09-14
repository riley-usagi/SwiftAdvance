class FightPresenter: FightModuleInput, FightViewOutput, FightInteractorOutput {

    weak var view: FightViewInput!
    var interactor: FightInteractorInput!
    var router: FightRouterInput!

    func viewIsReady() {
    	view.setupInitialState()
    }

    func configureModule() {
    }
}
