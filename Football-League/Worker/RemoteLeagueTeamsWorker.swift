//
//  RemoteLeagueTeamsWorker.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Moya


class RemoteLeagueTeamsWorker {
    
    let teamProvider = MoyaProvider<TeamsService>()
    let networkManager = NetworkManger()
    
    func getPremierLeagueTeamList(completionHandler:@escaping (Result<TeamList>) -> ()){
        networkManager.getData(provider: teamProvider, service: .getPremierLeagueTeams, decodeToType: TeamList.self, completionHandler: completionHandler)
    }
    
    func getTeamInfo(teamId: Int, completionHandler:@escaping (Result<Team>) -> ()){
        networkManager.getData(provider: teamProvider, service: .getTeamInfo(teamId: teamId), decodeToType: Team.self, completionHandler: completionHandler)
    }
}
