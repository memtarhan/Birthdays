//
//  DetailsAssembly.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import Swinject
import UIKit

class DetailsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DetailsViewController.self) { r in
            let viewController = DetailsViewControllerImpl(nibName: "DetailsViewController", bundle: nil)
            let presenter = r.resolve(DetailsPresenter.self)!
            let interactor = r.resolve(DetailsInteractor.self)!
            let router = r.resolve(DetailsRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(DetailsPresenter.self) { _ in
            DetailsPresenterImpl()
        }

        container.register(DetailsInteractor.self) { _ in
            DetailsInteractorImpl()
        }

        container.register(DetailsRouter.self) { r in
            DetailsRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }
    }
}
