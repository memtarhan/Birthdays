//
//  HomeRouter.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol HomeRouter: AnyObject {
    var view: HomeViewController? { get set }
}

class HomeRouterImpl: HomeRouter {
    var view: HomeViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}
