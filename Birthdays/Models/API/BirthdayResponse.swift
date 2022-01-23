//
//  BirthdayResponse.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import Foundation

class BirthdaysResponse: Codable {
    var results: [BirthdayResponse]
}

class BirthdayResponse: Codable {
    var name: NameResponse?
    var dateOfBirth: DateOfBirthResponse?

    enum CodingKeys: String, CodingKey {
        case name
        case dateOfBirth = "dob"
    }
}

class NameResponse: Codable {
    var title: String?
    var first: String?
    var last: String?
}

class DateOfBirthResponse: Codable {
    var date: Date?
    var age: Int?
}
