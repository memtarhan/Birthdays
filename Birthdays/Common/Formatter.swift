//
//  Formatter.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import Foundation

func formatNameAsSignature(first: String?, last: String?) -> String {
    var firstCharacter = ""
    var lastCharacter = ""

    if let first = first {
        if first.count > 0 {
            firstCharacter = "\(first.first!)"
        }
    }

    if let last = last {
        if last.count > 0 {
            lastCharacter = "\(last.first!)"
        }
    }

    return "\(firstCharacter)\(lastCharacter)"
}
