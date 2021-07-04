//
//  TeamInfoRouter.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//

import UIKit
import SafariServices

class TeamInfoRouter {
    weak var viewController: UIViewController?
}

extension TeamInfoRouter: TeamInfoRouterProtocol{
    
    static func createModule()->UIViewController{
        let view                = TeamInfoVC()
        let interactor          = TeamInfoInteractor()
        let router              = TeamInfoRouter()
        let presenter           = TeamInfoPresenter(view: view, interactor: interactor, router: router)
        view.presenter          = presenter
        interactor.presenter    = presenter
        router.viewController   = view
        return view
    }
    
    func dismiss(){
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    func presentSafariVC (with url : URL) {
        AppHelper.presentSafariVC (with : url,VC: viewController!)
    }
    
    func showAlert(with title: String, message: String) {
        viewController!.showAlert(title: title, message: message)
    }
}
