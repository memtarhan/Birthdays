//
//  BirthdayService.swift
//  Birthdays
//
//  Created by Mehmet Tarhan on 23/01/2022.
//

import Alamofire
import Foundation

protocol BirthdayService: APICallable {
    /**
     Retrieves all birthdays

     - Parameter completionBlock: A completion block with success and/or failure messages
     */
    func retrieveAll(_ completionBlock: @escaping (Result<BirthdaysResponse, NetworkError>) -> Void)
}

class BirthdayServiceImpl: BirthdayService {
    func retrieveAll(_ completionBlock: @escaping (Result<BirthdaysResponse, NetworkError>) -> Void) {
        guard let url = URL(string: "\(baseURL)?results=1000&seed=chalkboard&inc=name,dob") else {
            completionBlock(.failure(NetworkError.invalidURL))
            return
        }

        AF.request(url).responseJSON { response in
            guard let data = response.data else {
                completionBlock(.failure(.invalidResponse))
                return
            }

            do {
                let response = try self.decoder.decode(BirthdaysResponse.self, from: data)
                completionBlock(.success(response))

            } catch {
                completionBlock(.failure(.invalidResponse))
            }
        }
    }
}
