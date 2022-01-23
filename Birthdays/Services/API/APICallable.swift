//
//  APICallable.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import Alamofire
import Foundation

protocol APICallable {
    var baseURL: String { get } // Base URL
    var decoder: JSONDecoder { get }
}

extension APICallable {
    var baseURL: String { return "https://randomuser.me/api/" }
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        return decoder
    }
}
