//
//  CustomButton.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import UIKit

class CustomButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = 5.0
        backgroundColor = .label
        setTitleColor(.systemBackground, for: [])
        titleLabel?.font =  .systemFont(ofSize: 14, weight: .bold)
    }
}
