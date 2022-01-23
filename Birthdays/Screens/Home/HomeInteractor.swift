//
//  HomeInteractor.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol HomeInteractor: AnyObject {
    var presenter: HomePresenter? { get set }

    func retrieveBirthdays(_ completionBlock: @escaping (Result<[BirthdayResponse], NetworkError>) -> Void)
}

class HomeInteractorImpl: HomeInteractor {
    var presenter: HomePresenter?

    private let birthdayService: BirthdayService

    init(birthdayService: BirthdayService) {
        self.birthdayService = birthdayService
    }

    func retrieveBirthdays(_ completionBlock: @escaping (Result<[BirthdayResponse], NetworkError>) -> Void) {
        birthdayService.retrieveAll { result in
            switch result {
            case let .success(data):
                completionBlock(.success(data.results))
            case let .failure(error):
                completionBlock(.failure(error))
            }
        }
    }
}
