//
//  HomeViewController.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol HomeViewController: AnyObject {
    var presenter: HomePresenter? { get set }
}

class HomeViewControllerImpl: UIViewController {
    var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = "Birthdays"
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImpl: HomeViewController {
}
