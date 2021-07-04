//
//  PremierLeagueVC.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import UIKit

class PremierLeagueVC: UIViewController {
    
    var presenter: PremierLeaguePresenterProtocol?
    
    @IBOutlet weak var teamsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        presenter?.viewDidLoad()
        configureTeamsTableView()
    }
}

extension PremierLeagueVC: PremierLeagueViewProtocol{
    
    
    func configureTeamsTableView(){
        teamsTableView.dataSource   = self
        teamsTableView.delegate     = self
        teamsTableView.register(TeamCell.nib(), forCellReuseIdentifier: TeamCell.identifier)
    }
    
    func reloadTeamListTableView() {
        teamsTableView.reloadData()
    }
    
    func showLoadingIndicatore() {
        print("Should Show Loading Indicator")
        startActivityIndicator()
    }
    
    func hideLoadingIndicatore() {
        print("Should Hide Loading Indicator")
        stopActivityIndicator()
    }
}

extension PremierLeagueVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfTeams ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamsTableView.dequeueReusableCell(withIdentifier: TeamCell.identifier) as! TeamCell
        presenter?.configueCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showTeamInfo(with: indexPath)
    }
}

