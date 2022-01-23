//
//  HomePresenter.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol HomePresenter: AnyObject {
    var view: HomeViewController? { get set }
    var interactor: HomeInteractor? { get set }
    var router: HomeRouter? { get set }
}

class HomePresenterImpl: HomePresenter {
    var view: HomeViewController?
    var interactor: HomeInteractor?
    var router: HomeRouter?
}
