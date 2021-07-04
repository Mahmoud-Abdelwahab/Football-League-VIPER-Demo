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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureTeamsTableView()
    }
    
    @IBAction func didTapShowTeamWebsiteBtn(_ sender: Any) {
        presenter?.showSafariVC()
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
    
    func reloadPlayerTableView(){
        playersTableView.reloadData()
    }
    
    func configureUI(teamName:String,logoURL:URL){
        teamNameLable.text = teamName
        teamAvatarImage.kf.setImage(with: logoURL, options: [.processor(SVGImgProcessor())])
    }
}



extension TeamInfoVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfPlayers ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playersTableView.dequeueReusableCell(withIdentifier: PlayerCell.identifier) as! PlayerCell
        presenter?.configureCell(playerCell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}

