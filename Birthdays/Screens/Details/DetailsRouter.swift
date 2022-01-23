//
//  DetailsRouter.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol DetailsRouter: AnyObject {
    var view: DetailsViewController? { get set }
    
    func navigateBack()
}

class DetailsRouterImpl: DetailsRouter {
    var view: DetailsViewController?

    private let factory: ViewControllerFactory

    init(factory: ViewControllerFactory) {
        self.factory = factory
    }
    
    func navigateBack() {
        guard let source = view as? UIViewController else { return }
        DispatchQueue.main.async {
            source.dismiss(animated: true, completion: nil)
        }
    }
}
