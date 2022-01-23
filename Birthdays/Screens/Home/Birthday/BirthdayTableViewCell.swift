//
//  BirthdayTableViewCell.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import UIKit

class BirthdayTableViewCell: UITableViewCell {
    @IBOutlet var photoView: PhotoSignatureView!
    @IBOutlet weak var signatureLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoView.makeCircle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ user: HomeEntity.User.ViewModel) {
        signatureLabel.text = user.photoSignature
        nameLabel.text = user.fullName
        birthdayLabel.text = user.birthday
    }
}
