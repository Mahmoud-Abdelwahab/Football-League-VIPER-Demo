//
//  PremierLeagueRouter.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import UIKit
import SafariServices

class PremierLeagueRouter {
    weak var viewController: UIViewController?
}

extension PremierLeagueRouter: PremierLeagueRouterProtocol{
    static func createModule()->UIViewController{
        let view                = PremierLeagueVC()
        let interactor          = PremierLeagueInteractor()
        let router              = PremierLeagueRouter()
        let presenter           = PremierLeaguePresenter(view: view, interactor: interactor, router: router)
        view.presenter          = presenter
        interactor.presenter    = presenter
        router.viewController   = view
        return view
    }
    
    func showTeamInfo(with teamId: Int) {
        let teamInfoVC = TeamInfoRouter.createModule() as! TeamInfoVC
        teamInfoVC.presenter?.teamId = teamId
        teamInfoVC.modalPresentationStyle = .fullScreen
        viewController?.present(teamInfoVC, animated: true)
    }
    
    func presentSafariVC (with url : URL) {
        AppHelper.presentSafariVC (with : url,VC: viewController!)
    }
    
    func showAlert(with title: String, message: String) {
        viewController!.showAlert(title: title, message: message)
    }
    
}
