//
//  HomeAssembly.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import Swinject
import UIKit

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeViewController.self) { r in
            let viewController = HomeViewControllerImpl(nibName: "HomeViewController", bundle: nil)
            let presenter = r.resolve(HomePresenter.self)!
            let interactor = r.resolve(HomeInteractor.self)!
            let router = r.resolve(HomeRouter.self)!

            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            viewController.presenter = presenter
            router.view = viewController

            return viewController
        }

        container.register(HomePresenter.self) { _ in
            HomePresenterImpl()
        }

        container.register(HomeInteractor.self) { r in
            HomeInteractorImpl(userService: r.resolve(UserService.self)!)
        }

        container.register(HomeRouter.self) { r in
            HomeRouterImpl(factory: r.resolve(ViewControllerFactory.self)!)
        }
    }
}
