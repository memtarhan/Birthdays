//
//  NetworkError.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import Foundation

protocol Throwable: Error {
    var title: String { get }
    var message: String { get }
}

enum NetworkError: Throwable {
    case invalidURL
    case invalidResponse

    var title: String {
        switch self {
        case .invalidURL: return "URL is invalid"
        case .invalidResponse: return "Response is invalid"
        }
    }

    var message: String {
        switch self {
        case .invalidURL: return "URL is invalid"
        case .invalidResponse: return "Response is invalid"
        }
    }
}
