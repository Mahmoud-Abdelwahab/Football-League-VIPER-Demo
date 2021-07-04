//
//  TeamInfoInteractor.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//

import Foundation

class TeamInfoInteractor {
    weak var presenter: TeamInfoInteractorOutputProtocol?
    var remoteLeagueTeamsWorker = RemoteLeagueTeamsWorker()
}

extension TeamInfoInteractor: TeamInfoInteractorInputProtocol{
    func getTeamInfo(with teamId: Int) {
        remoteLeagueTeamsWorker.getTeamInfo(teamId: teamId) {[weak self] result in
            guard let self = self else{return}
            switch result{
            case .success(let team):
                self.presenter?.teamInfoFetchedSuccessfully(team: team)
            case .failure(let error):
                self.presenter?.teamInfoFetchingFailed(with: error)
            }
        }
    }
}
