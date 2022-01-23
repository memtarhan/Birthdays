//
//  PhotoSignatureView.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import UIKit

class PhotoSignatureView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = frame.height / 2
        backgroundColor = .photoSignature
    }
}
