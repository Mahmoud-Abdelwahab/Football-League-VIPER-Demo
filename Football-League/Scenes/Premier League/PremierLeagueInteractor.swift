//
//  PremierLeagueInteractor.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Foundation

class PremierLeagueInteractor {
   weak var presenter: PremierLeagueInteractorOutputProtocol?
    var remoteLeagueTeamsWorker = RemoteLeagueTeamsWorker()
}

extension PremierLeagueInteractor: PremierLeagueInteractorInputProtocol{
    
    func getPremierLeagueTeamList() {
        remoteLeagueTeamsWorker.getPremierLeagueTeamList {[weak self] result in
            guard let self = self else{return}
            switch result{
            
            case .success(let teamList):
                self.presenter?.teamListFetchedSuccessfully(teams: teamList.teams ?? [])
            case .failure(let error):
                self.presenter?.teamFetchingFailed(with: error)
            }
        }
    }
}
