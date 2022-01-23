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
    
    func display(_ user: DetailsEntity.User.ViewModel)
}

class DetailsViewControllerImpl: UIViewController {
    var presenter: DetailsPresenter?
    var response: BirthdayResponse?

    // MARK: - Outlets

    @IBOutlet var photoSignatureView: UIView!
    @IBOutlet weak var signatureLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    
    @IBAction func didTapGoBackButton(_ sender: Any) {
        // - Alternatively could use router to navigate back
        dismiss(animated: true, completion: nil)
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
