//
//  TeamCell.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import UIKit

class TeamCell: UITableViewCell {

static let identifier = "TeamCell"
    
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamNameLable: UILabel!
    @IBOutlet weak var teamAddressLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupImagwView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func didTapShowTeamWebsiteBtn(_ sender: Any) {
        
    }
    
    private func setupImagwView(){
        teamLogoImageView.layer.cornerRadius = teamLogoImageView.frame.width/2
    }
    
}
