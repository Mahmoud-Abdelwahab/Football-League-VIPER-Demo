//
//  TeamsService.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Foundation
import Moya

enum TeamsService {
    case getPremierLeagueTeams
    case getTeamInfo(teamId: Int)
}

extension TeamsService: TargetType {
    
    var baseURL: URL {
        return URL(string: MoyaHelpers.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getPremierLeagueTeams:
            return "competitions/2021/teams"
            
        case .getTeamInfo(let teamId):
            return "teams/\(teamId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPremierLeagueTeams, .getTeamInfo:
            return .get
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        
        switch self {
        case .getPremierLeagueTeams,.getTeamInfo :
        return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        return [
            "X-Auth-Token": MoyaHelpers.apiKey
               ]
    }
}
