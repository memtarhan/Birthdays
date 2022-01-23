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
    
    func present(_ user: UserResponse)
    func presentPrevious()
}

class DetailsPresenterImpl: DetailsPresenter {
    var view: DetailsViewController?
    var interactor: DetailsInteractor?
    var router: DetailsRouter?
    
    func present(_ user: UserResponse) {
        let firstName = user.name?.first
        let lastName = user.name?.last
        let fullName = "\(firstName ?? "") \(lastName ?? "")"
        let signature = Formatter.shared.formatNameAsSignature(first: firstName, last: lastName)
        let age = user.dateOfBirth?.age
        
        let viewModel =  DetailsEntity.User.ViewModel(signature: signature,
                                            name: fullName,
                                                      age: "\(age ?? 0) years old")
        
        self.view?.display(viewModel)

    }
    
    func presentPrevious() {
        router?.navigateBack()
    }
}
