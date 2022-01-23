//
//  HomeRouter.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol HomeRouter: AnyObject {
    var view: HomeViewController? { get set }

    func navigateToDetails(withResponse response: BirthdayResponse)
}

class HomeRouterImpl: HomeRouter {
    var view: HomeViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }

    func navigateToDetails(withResponse response: BirthdayResponse) {
        let destination = factory.details
        destination.response = response
        guard let nextViewController = destination as? UIViewController,
              let sourceViewController = view as? UIViewController else { return }
        
        nextViewController.modalTransitionStyle = .coverVertical
        nextViewController.modalPresentationStyle = .fullScreen
        sourceViewController.present(nextViewController, animated: true, completion: nil)
    }
}
