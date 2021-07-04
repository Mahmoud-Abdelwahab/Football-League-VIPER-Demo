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
    
    func presentSafariVC (with url : URL) {
         let safariVC = SFSafariViewController(url: url)
         safariVC.preferredControlTintColor = .systemGreen
        viewController?.present(safariVC , animated: true)
     }
    
}
