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
    
    var teamsDataSource = [Team]()
    
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
    
    var numberOfTeams: Int{
        return teamsDataSource.count
    }
    
    func configueCell(cell: TeamCellViewProtocol, indexPath: IndexPath) {
        var teamCell = cell
        let viewModel = TeamListVM(team: teamsDataSource[indexPath.row])
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
    
    func showTeamInfo(with indexPath: IndexPath) {
        guard  let teamId = teamsDataSource[indexPath.row].id else {
            self.router?.showAlert(with: "Warning", message: "Can't find the Team ID")
            return
        }
        router?.showTeamInfo(with: teamId)
    }
    
    func teamListFetchedSuccessfully(teams: [Team]) {
        view?.hideLoadingIndicatore()
        self.teamsDataSource.append(contentsOf: teams)
        view?.reloadTeamListTableView()
    }
    
    func teamFetchingFailed(with error: String) {
        view?.hideLoadingIndicatore()
        self.router?.showAlert(with: "Warning", message: error)
    }
}


