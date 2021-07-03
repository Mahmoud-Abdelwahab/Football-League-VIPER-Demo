//
//  PremierLeaguePresenter.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Foundation

class PremierLeaguePresenter{
    weak var view: PremierLeagueViewProtocol?
    private var interactor: PremierLeagueInteractorInputProtocol?{
        didSet{
            
        }
    }
    private let router    : PremierLeagueRouterProtocol?
    
    init(view: PremierLeagueViewProtocol, interactor:PremierLeagueInteractorInputProtocol,
         router: PremierLeagueRouterProtocol)
    {
        self.view       = view
        self.interactor = interactor
        self.router     = router
    }
}

extension PremierLeaguePresenter: PremierLeaguePresenterProtocol,PremierLeagueInteractorOutputProtocol{
    
 
    
    
}
