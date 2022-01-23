//
//  UserServiceAssembly.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import Foundation
import Swinject

class UserServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UserService.self) { _ in
            UserServiceImpl()
        }
    }
}
