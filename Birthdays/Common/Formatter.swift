//
//  Formatter.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import Foundation

// - A formatter class for general formatting purposes
struct Formatter {
    /**
     Formates first and last name to a signature. i.e Mehmet Tarhan -> MT

     - Parameter first: First name
     - Parameter last: Last name

     - Returns: A new string with signature format
     */
    static func formatNameAsSignature(first: String?, last: String?) -> String {
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
}

