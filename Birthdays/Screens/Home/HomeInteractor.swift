//
//  HomeInteractor.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol HomeInteractor: AnyObject {
    var presenter: HomePresenter? { get set }
}

class HomeInteractorImpl: HomeInteractor {
    var presenter: HomePresenter?
}
