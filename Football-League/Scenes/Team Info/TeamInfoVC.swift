//
//  TeamInfoVC.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import UIKit

class TeamInfoVC: UIViewController {
    
    var presenter: TeamInfoPresenterProtocol?
    
    @IBOutlet weak var playersTableView: UITableView!
    @IBOutlet weak var teamAvatarImage: UIImageView!
    @IBOutlet weak var noPlayerFoundPlaceHolderLable: UILabel!
    @IBOutlet weak var teamNameLable: UILabel!
    
    var teamId: Int?
    var teamInfo :Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        presenter?.getTeamInfo(with: teamId)
        configureTeamsTableView()
    }
    
    @IBAction func didTapShowTeamWebsiteBtn(_ sender: Any) {
        presenter?.showSafariVC(with: teamInfo?.website)
    }
    
    @IBAction func didTapDismissBtn(_ sender: Any) {
        presenter?.dismiss()
    }
}


extension TeamInfoVC: TeamInfoViewProtocol{
    
    func configureTeamsTableView(){
        playersTableView.dataSource   = self
        playersTableView.delegate     = self
        playersTableView.register(PlayerCell.nib(), forCellReuseIdentifier: PlayerCell.identifier)
    }
    
    func showLoadingIndicatore() {
        print("Should Show Loading Indicator")
        startActivityIndicator()
    }
    
    func hideLoadingIndicatore() {
        print("Should Hide Loading Indicator")
        stopActivityIndicator()
    }
    
    func toggleShowingPlaceHolderLable(isHidden: Bool){
        noPlayerFoundPlaceHolderLable.isHidden = isHidden
    }
    
    
    func configureUI(team: Team){
        teamInfo = team
        teamNameLable.text = team.shortName
        toggleShowingPlaceHolderLable(isHidden:team.squad?.isEmpty ?? false ? false : true)
        if let url = URL(string: team.crestURL ?? ""){
            teamAvatarImage.kf.setImage(with: url, options: [.processor(SVGImgProcessor())])
        }
        playersTableView.reloadData()
    }
}



extension TeamInfoVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teamInfo?.squad?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playersTableView.dequeueReusableCell(withIdentifier: PlayerCell.identifier) as! PlayerCell
        let player = teamInfo?.squad?[indexPath.row]
        presenter?.configureCell(playerCell: cell, player: player)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}

