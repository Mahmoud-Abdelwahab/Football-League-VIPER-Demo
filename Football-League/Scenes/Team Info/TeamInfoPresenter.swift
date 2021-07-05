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
    
    init(view: TeamInfoViewProtocol, interactor:TeamInfoInteractorInputProtocol,
         router: TeamInfoRouterProtocol)
    {
        self.view       = view
        self.interactor = interactor
        self.router     = router
    }
}

extension TeamInfoPresenter: TeamInfoPresenterProtocol,TeamInfoInteractorOutputProtocol{
    
    func viewDidLoad() {
      
    }
    
    func getTeamInfo(with id :Int?){
        guard  let teamId = id else {
            self.router?.showAlert(with: "Warning", message: "Team ID Not Found")
            return
        }
        view?.showLoadingIndicatore()
        interactor?.getTeamInfo(with: teamId)
    }
    
    func configureCell(playerCell: PlayerCellViewProtocol, player: Player?) {
        
        guard  let player = player else {
            self.router?.showAlert(with: "Warning", message: "Player Not Found")
            return
        }
        
        let viewModel = PlayerVM(player: player)
        playerCell.configure(viewModel: viewModel)
    }
    
    func teamInfoFetchedSuccessfully(team: Team) {
        view?.hideLoadingIndicatore()
        view?.configureUI(team: team)
    }

    func teamInfoFetchingFailed(with error: String) {
        view?.hideLoadingIndicatore()
        self.router?.showAlert(with: "Warning", message: error)
    }
    
    func showSafariVC(with url: String?) {
        guard  let url = URL(string: url ?? "") else {
            self.router?.showAlert(with: "Warning", message: "Website not found ...")
            return
        }
        router?.presentSafariVC(with: url)
    }
    
    func dismiss(){
        router?.dismiss()
    }
} 


