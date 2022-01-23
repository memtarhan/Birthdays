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

    func present()
}

class HomePresenterImpl: HomePresenter {
    var view: HomeViewController?
    var interactor: HomeInteractor?
    var router: HomeRouter?

    func present() {
        interactor?.retrieveBirthdays({ result in
            switch result {
            case let .success(users):
                let viewModels = users.map { birthday -> HomeEntity.User.ViewModel in
                    let firstName = birthday.name?.first
                    let lastName = birthday.name?.last
                    let fullName = "\(firstName ?? "") \(lastName ?? "")"
                    let signature = self.formatNameAsSignature(first: firstName, last: lastName)
                    let birthdate = birthday.dateOfBirth?.date?.asBirthday ?? ""
                    let age = birthday.dateOfBirth?.age
                    return HomeEntity.User.ViewModel(photoSignature: signature,
                                                     fullName: fullName,
                                                     birthday: birthdate,
                                                     age: "\(age ?? 0) years old")
                }

                self.view?.display(viewModels)

            case let .failure(error):
                let viewModel = HomeEntity.Error.ViewModel(title: error.title,
                                                           message: error.message,
                                                           button: "Cancel")
                self.view?.display(viewModel)
            }
        })
    }

    private func formatNameAsSignature(first: String?, last: String?) -> String {
        var firstCharacter = ""
        var lastCharacter = ""

        if let first = first {
            if first.count > 0 {
                firstCharacter = "\(first.first!)"
            }
        }

        if let last = last {
            if last.count > 0 {
                lastCharacter = "\(last.first!)"
            }
        }

        return "\(firstCharacter)\(lastCharacter)"
    }
}
