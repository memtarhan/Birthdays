//
//  DetailsRouter.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol DetailsRouter: AnyObject {
    var view: DetailsViewController? { get set }
}

class DetailsRouterImpl: DetailsRouter {
    var view: DetailsViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
}
