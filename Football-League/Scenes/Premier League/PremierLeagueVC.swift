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
    
    var teamsDataSource: [Team]?
    
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
       
    }
    
    func showLoadingIndicatore() {
        print("Should Show Loading Indicator")
        startActivityIndicator()
    }
    
    func hideLoadingIndicatore() {
        print("Should Hide Loading Indicator")
        stopActivityIndicator()
    }
    
    func configureUI(teams: [Team]){
        self.teamsDataSource = teams
        teamsTableView.reloadData()
    }
}

extension PremierLeagueVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teamsDataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamsTableView.dequeueReusableCell(withIdentifier: TeamCell.identifier) as! TeamCell
        presenter?.configueCell(cell: cell, team: teamsDataSource?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showTeamInfo(with: teamsDataSource?[indexPath.row].id)
    }
}

