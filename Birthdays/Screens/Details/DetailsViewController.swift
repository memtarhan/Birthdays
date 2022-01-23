//
//  DetailsViewController.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

protocol DetailsViewController: AnyObject {
    var presenter: DetailsPresenter? { get set }
    var response: UserResponse? { get set }

    func display(_ user: DetailsEntity.User.ViewModel)
}

class DetailsViewControllerImpl: UIViewController {
    var presenter: DetailsPresenter?
    var response: UserResponse?

    // MARK: - Outlets

    @IBOutlet var photoSignatureView: UIView!
    @IBOutlet var signatureLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @IBAction func didTapGoBackButton(_ sender: Any) {
        presenter?.presentPrevious()
    }

    private func setup() {
        photoSignatureView.makeCircle()

        guard let response = response else {
            dismiss(animated: true, completion: nil)
            return
        }

        presenter?.present(response)
    }
}

// MARK: - DetailsViewController

extension DetailsViewControllerImpl: DetailsViewController {
    func display(_ user: DetailsEntity.User.ViewModel) {
        DispatchQueue.main.async {
            self.signatureLabel.text = user.signature
            self.nameLabel.text = user.name
            self.ageLabel.text = user.age
        }
    }
}
