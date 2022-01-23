//
//  HomeInteractor.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol HomeInteractor: AnyObject {
    var presenter: HomePresenter? { get set }
    
    func retrieveBirthdays()
}

class HomeInteractorImpl: HomeInteractor {
    var presenter: HomePresenter?

    private let birthdayService: BirthdayService

    init(birthdayService: BirthdayService) {
        self.birthdayService = birthdayService
    }
    
    func retrieveBirthdays() {
        birthdayService.retrieveAll { result in
            
        }
    }
}
