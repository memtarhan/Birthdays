//
//  HomeViewController.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol HomeViewController: AnyObject {
    var presenter: HomePresenter? { get set }

    func display(_ error: HomeEntity.Error.ViewModel)
    func display(_ birthdays: [HomeEntity.User.ViewModel])
}

class HomeViewControllerImpl: UIViewController {
    var presenter: HomePresenter?

    // MARK: - Outlets

    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties

    private let cellReuseIdentifier = "Birthday"
    private let cellNibIdentifier = "BirthdayTableViewCell"
    private let rowHeight: CGFloat = 96

    private var users = [HomeEntity.User.ViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = "Birthdays"

        setupTableView()

        activityIndicator.startAnimating()
        presenter?.present()
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
    func display(_ error: HomeEntity.Error.ViewModel) {
        let alertContoller = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: error.button, style: .cancel, handler: nil)
        alertContoller.addAction(cancelAction)

        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.present(alertContoller, animated: true, completion: nil)
        }
    }

    func display(_ birthdays: [HomeEntity.User.ViewModel]) {
        self.users = birthdays
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension HomeViewControllerImpl: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? BirthdayTableViewCell else { return UITableViewCell() }

        cell.configure(users[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDataSource

extension HomeViewControllerImpl: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
