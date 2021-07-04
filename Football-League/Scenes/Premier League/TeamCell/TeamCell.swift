//
//  TeamCell.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import UIKit
import SVGKit


class TeamCell: UITableViewCell {
    
    static let identifier = "TeamCell"
    
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamNameLable: UILabel!
    @IBOutlet weak var teamAddressLable: UILabel!
    var showSafariDelegate:(()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupImagwView()
    }
    
    static func nib()->UINib{
        UINib(nibName: TeamCell.identifier, bundle: Bundle.main)
    }
    
    @IBAction func didTapShowTeamWebsiteBtn(_ sender: Any) {
        showSafariDelegate?()
    }
    
    private func setupImagwView(){
        teamLogoImageView.layer.cornerRadius = teamLogoImageView.frame.width/2
    }
    
}

extension TeamCell: TeamCellViewProtocol{
    func configure(viewModel: TeamListVM) {
        teamNameLable.text    = viewModel.name
        teamAddressLable.text = viewModel.address
        teamLogoImageView.kf.setImage(with: viewModel.teamLogo, options: [.processor(SVGImgProcessor())])
    }
}
