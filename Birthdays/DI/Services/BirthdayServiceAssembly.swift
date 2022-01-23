//
//  BirthdayServiceAssembly.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import Foundation
import Swinject

class BirthdayServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(BirthdayService.self) { _ in
            BirthdayServiceImpl()
        }
    }
}
