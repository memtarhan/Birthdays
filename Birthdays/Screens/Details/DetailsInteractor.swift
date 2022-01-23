//
//  DetailsInteractor.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol DetailsInteractor: AnyObject {
    var presenter: DetailsPresenter? { get set }
}

class DetailsInteractorImpl: DetailsInteractor {
    var presenter: DetailsPresenter?
}
