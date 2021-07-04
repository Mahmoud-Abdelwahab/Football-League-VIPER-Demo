//
//  TeamInfoPresenter.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//


import Foundation

class TeamInfoPresenter{
    weak var view: TeamInfoViewProtocol?
    private var interactor: TeamInfoInteractorInputProtocol?
    private let router    : TeamInfoRouterProtocol?
    var teamId: Int?
    var teamInfo :Team?
    
    var placeHolderLableIsHidden:Bool{
        return  teamInfo?.squad?.isEmpty ?? false ? false : true
    }
    
    init(view: TeamInfoViewProtocol, interactor:TeamInfoInteractorInputProtocol,
         router: TeamInfoRouterProtocol)
    {
        self.view       = view
        self.interactor = interactor
        self.router     = router
    }
}

extension TeamInfoPresenter: TeamInfoPresenterProtocol,TeamInfoInteractorOutputProtocol{
    
    var numberOfPlayers: Int {
        return teamInfo?.squad?.count ?? 0
    }
    
    
    func viewDidLoad() {
        guard  let teamId = teamId else {
            self.router?.showAlert(with: "Warning", message: "Team ID Not Found")
            return
        }
        view?.showLoadingIndicatore()
        interactor?.getTeamInfo(with: teamId)
    }
    
    func configureCell(playerCell: PlayerCellViewProtocol, indexPath: IndexPath) {
        guard  let player = teamInfo?.squad?[indexPath.row] else {
            self.router?.showAlert(with: "Warning", message: "Player Not Found")
            return
        }
        let viewModel = PlayerVM(player: player)
        
        playerCell.configure(viewModel: viewModel)
    }
    
    func teamInfoFetchedSuccessfully(team: Team) {
        view?.hideLoadingIndicatore()
        teamInfo = team
        let url = URL(string: team.crestURL ?? "") ?? URL(fileURLWithPath: "")
        view?.configureUI(teamName: team.name ?? "No Name", logoURL:url )
        view?.toggleShowingPlaceHolderLable(isHidden:placeHolderLableIsHidden)
        view?.reloadPlayerTableView()
    }
    
    func teamInfoFetchingFailed(with error: String) {
        view?.hideLoadingIndicatore()
        self.router?.showAlert(with: "Warning", message: error)
    }
    
    func showSafariVC() {
        guard  let url = URL(string: teamInfo?.website ?? "") else {
            self.router?.showAlert(with: "Warning", message: "Website not found ...")
            return
        }
        router?.presentSafariVC(with: url)
    }
    
    func dismiss(){
        router?.dismiss()
    }
} 


