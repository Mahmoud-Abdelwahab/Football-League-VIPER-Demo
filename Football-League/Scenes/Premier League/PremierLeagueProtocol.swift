//
//  PremierLeagueProtocol.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Foundation

protocol PremierLeagueViewProtocol: AnyObject{
    var presenter: PremierLeaguePresenterProtocol?{get set}
    
    func showSuccessAlert(message: String)
    func showErrorAlert(message: String)
    func showLoadingIndicatore()
    func hideLoadingIndicatore()
    func reloadTeamListTableView()
}

protocol PremierLeaguePresenterProtocol:AnyObject{
     var view: PremierLeagueViewProtocol?{get set}
    var numberOfTeams: Int{get}
    
    func viewDidLoad()
    func configueCell(cell: TeamCellViewProtocol, indexPath: IndexPath)
}

protocol PremierLeagueRouterProtocol {
    func presentSafariVC (with url : URL)
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


