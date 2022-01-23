//
//  DetailsPresenter.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol DetailsPresenter: AnyObject {
    var view: DetailsViewController? { get set }
    var interactor: DetailsInteractor? { get set }
    var router: DetailsRouter? { get set }
}

class DetailsPresenterImpl: DetailsPresenter {
    var view: DetailsViewController?
    var interactor: DetailsInteractor?
    var router: DetailsRouter?
}
