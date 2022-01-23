//
//  ViewControllerFactory.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import Foundation
import Swinject

protocol ViewControllerFactory {
    var details: DetailsViewController { get }
    var home: HomeViewController { get }
}

class ViewControllerFactoryImpl: ViewControllerFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    var details: DetailsViewController { assembler.resolver.resolve(DetailsViewController.self)! }
    var home: HomeViewController { assembler.resolver.resolve(HomeViewController.self)! }
}
