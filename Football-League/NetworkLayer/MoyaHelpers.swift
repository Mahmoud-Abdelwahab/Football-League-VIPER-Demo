//
//  MoyaHelpers.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(String)
}


class MoyaHelpers {
    
    private init() { }
    
    private enum BuildScheme {
        case debug
        case release
    }

    private static var scheme: BuildScheme = {
        #if DEBUG
        return .debug
        #else
        return .release
        #endif
    }()
    
    static var baseURL: String {
        switch scheme {
        case .debug:
            return "https://api.football-data.org/v2"
        case .release:
            return "https://api.football-data.org/v2"
        }
    }
    
    static var apiKey: String {
        return "a7842fca1ad248be8ad862c561a7502b"
    }
    
    
}
