//
//  NetworkManger.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//

import Foundation
import Moya

class NetworkManger {
    
    func getData<T: Codable,E: TargetType>( provider: MoyaProvider<E>, service: E ,decodeToType type: T.Type, completionHandler: @escaping (Result<T>) -> ()) {
        provider.request(service) {(result) in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    do {
                        let model = try JSONDecoder().decode(T.self, from: response.data)
                        completionHandler(.success(model))
                    } catch(let error) {
                        print(error)
                        completionHandler(.failure(AppError.jsonConversionFailure.rawValue))
                    }
                }else{
                    completionHandler(.failure(AppError.localizeError(statusCode: response.statusCode).rawValue))
                }
                
            case .failure(let error):
                completionHandler(.failure(error.localizedDescription))
            }
        }
    }
}
