//
//  PremierLeagueProtocol.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Foundation

protocol PremierLeagueViewProtocol:BaseViewControllerProtocol, AnyObject{
    var presenter: PremierLeaguePresenterProtocol?{get set}
    var teamsDataSource:[Team]?{get set}
    
    func configureUI(teams: [Team])
}

protocol PremierLeaguePresenterProtocol:AnyObject{
    var view: PremierLeagueViewProtocol?{get set}
    
    func viewDidLoad()
    func configueCell(cell: TeamCellViewProtocol, team: Team?)
    func showTeamInfo(with teamId: Int?)
}

protocol PremierLeagueRouterProtocol:BaseRouter {
    func showTeamInfo(with teamId: Int)
}

// Interactor

protocol  PremierLeagueInteractorInputProtocol {
    var presenter: PremierLeagueInteractorOutputProtocol?{get set}
    func getPremierLeagueTeamList()
}

protocol  PremierLeagueInteractorOutputProtocol:AnyObject {
    func teamListFetchedSuccessfully(teams: [Team])
    func teamFetchingFailed(with error: String)
}

// Cell

protocol TeamCellViewProtocol {
    var showSafariDelegate:(()->())?{get set}
    func configure(viewModel: TeamListVM)
}


