//
//  PlayerCell.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    static let identifier = "PlayerCell"
    
    @IBOutlet weak var positionLable: UILabel!
    @IBOutlet weak var playerNameLable: UILabel!
    @IBOutlet weak var shirtNumberLable: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    static func nib()->UINib{
        UINib(nibName: PlayerCell.identifier, bundle: Bundle.main)
    }
    
    private func setupView(){
        containerView.layer.cornerRadius = 8
    }
}

extension PlayerCell: PlayerCellViewProtocol{
    func configure(viewModel: PlayerVM) {
        playerNameLable.text  = viewModel.name
        positionLable.text = viewModel.position
        if let shirtNumber = viewModel.shirtNumber {
            shirtNumberLable.text = "\(shirtNumber)"
        }
    }
}
