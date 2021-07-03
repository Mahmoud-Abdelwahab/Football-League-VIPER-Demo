//
//  PremierLeagueVC.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import UIKit

class PremierLeagueVC: UIViewController {

    var presenter: PremierLeaguePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }


}

extension PremierLeagueVC: PremierLeagueViewProtocol{
    
}
