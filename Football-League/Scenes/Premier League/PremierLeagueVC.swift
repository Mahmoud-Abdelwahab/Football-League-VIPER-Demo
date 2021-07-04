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
        presenter?.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        configureTeamsTableView()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }


}

extension PremierLeagueVC: PremierLeagueViewProtocol{
   
    
    func configureTeamsTableView(){
        teamsTableView.dataSource   = self
        teamsTableView.delegate     = self
        teamsTableView.register(TeamCell.nib(), forCellReuseIdentifier: TeamCell.identifier)
    }
    
    func showLoadingIndicatore() {
        print("Should Show Loading Indicator")
    }
    
    func hideLoadingIndicatore() {
        print("Should Hide Loading Indicator")
    }

    func showSuccessAlert(message: String){
        print("Should Show Success Alert with : ", message)
    }
    
    func showErrorAlert(message: String) {
        print("Should Show Error Alert  with : ", message)
    }
    
    func reloadTeamListTableView() {
        teamsTableView.reloadData()
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
}

