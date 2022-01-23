//
//  HomeEntity.swift
//  Birthdays
//
//  Created Mehmet Tarhan on 23/01/2022.
//

import UIKit

struct HomeEntity {
    struct Error {
        struct ViewModel {
            let title: String
            let message: String
            let button: String
        }
    }
    
    struct User {
        struct ViewModel {
            let photoSignature: String
            let fullName: String
            let birthday: String
            let age: String
        }
    }
}
