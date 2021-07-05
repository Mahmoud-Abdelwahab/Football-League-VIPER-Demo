//
//  TeamInfoProtocols.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//

import Foundation

protocol TeamInfoViewProtocol:BaseViewControllerProtocol, AnyObject{
    var  presenter: TeamInfoPresenterProtocol?{get set}
    var teamId: Int?{get set}
    var teamInfo :Team?{get set}
    func configureUI(team: Team)
    func toggleShowingPlaceHolderLable(isHidden: Bool)
}

protocol TeamInfoPresenterProtocol:AnyObject{
    var view: TeamInfoViewProtocol?{get set}
    
    func getTeamInfo(with id :Int?)
    func viewDidLoad()
    func configureCell(playerCell: PlayerCellViewProtocol, player: Player?)
    func dismiss()
    func showSafariVC(with url: String?)
}

protocol TeamInfoRouterProtocol:BaseRouter {
    
}

// Interactor

protocol  TeamInfoInteractorInputProtocol {
    var presenter: TeamInfoInteractorOutputProtocol?{get set}
    func getTeamInfo(with teamId: Int)
}

protocol  TeamInfoInteractorOutputProtocol:AnyObject {
    func teamInfoFetchingFailed(with error: String)
    func teamInfoFetchedSuccessfully(team: Team)
}


//PlayerCell

protocol PlayerCellViewProtocol {
    func configure(viewModel: PlayerVM)
}

