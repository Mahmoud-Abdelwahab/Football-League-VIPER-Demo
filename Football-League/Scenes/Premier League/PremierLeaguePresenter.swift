//
//  PremierLeaguePresenter.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Foundation

class PremierLeaguePresenter{
    weak var view: PremierLeagueViewProtocol?
    private var interactor: PremierLeagueInteractorInputProtocol?
    private let router    : PremierLeagueRouterProtocol?
    
    init(view: PremierLeagueViewProtocol, interactor:PremierLeagueInteractorInputProtocol,
         router: PremierLeagueRouterProtocol)
    {
        self.view       = view
        self.interactor = interactor
        self.router     = router
    }
}

extension PremierLeaguePresenter: PremierLeaguePresenterProtocol,PremierLeagueInteractorOutputProtocol{
    
    func viewDidLoad() {
        view?.showLoadingIndicatore()
        interactor?.getPremierLeagueTeamList()
    }
    
    func configueCell(cell: TeamCellViewProtocol, team: Team?) {
        var teamCell = cell
        guard  let team = team else {
            return
        }
        let viewModel = TeamListVM(team: team)
        teamCell.showSafariDelegate = {[weak self] in
            guard let self = self else {return}
            
            guard  let url = viewModel.website  else {
                self.router?.showAlert(with: "Warning", message: "Website URL not found")
                return
            }
            self.router?.presentSafariVC(with: url)
        }
        teamCell.configure(viewModel: viewModel)
    }
    
    func showTeamInfo(with teamId: Int?) {
        guard  let teamId = teamId else {
            self.router?.showAlert(with: "Warning", message: "Can't find the Team ID")
            return
        }
        router?.showTeamInfo(with: teamId)
    }
    
    func teamListFetchedSuccessfully(teams: [Team]) {
        view?.hideLoadingIndicatore()
        view?.configureUI(teams: teams)
    }
    
    func teamFetchingFailed(with error: String) {
        view?.hideLoadingIndicatore()
        self.router?.showAlert(with: "Warning", message: error)
    }
}


