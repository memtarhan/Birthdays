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

    // MARK: - Outlets

    @IBOutlet var tableView: UITableView!

    // MARK: - Properties

    private let cellReuseIdentifier = "Birthday"
    private let cellNibIdentifier = "BirthdayTableViewCell"
    private let rowHeight: CGFloat = 96

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = "Birthdays"
        
        setupTableView()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 96

        let cellNib = UINib(nibName: cellNibIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellReuseIdentifier)
    }
}

// MARK: - HomeViewController

extension HomeViewControllerImpl: HomeViewController {
}

// MARK: - UITableViewDataSource

extension HomeViewControllerImpl: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? BirthdayTableViewCell else { return UITableViewCell() }
        return cell
    }
}

// MARK: - UITableViewDataSource

extension HomeViewControllerImpl: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
