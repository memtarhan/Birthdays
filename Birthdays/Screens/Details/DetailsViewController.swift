//
//  DetailsViewController.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol DetailsViewController: AnyObject {
    var presenter: DetailsPresenter? { get set }
    var response: BirthdayResponse? { get set }
}

class DetailsViewControllerImpl: UIViewController {
    var presenter: DetailsPresenter?
    var response: BirthdayResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        guard let response = response else {
            return
        }
        
        
    }
}

// MARK: - DetailsViewController

extension DetailsViewControllerImpl: DetailsViewController {
}
