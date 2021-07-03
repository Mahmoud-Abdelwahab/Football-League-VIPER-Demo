//
//  PremierLeagueProtocol.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Foundation

protocol PremierLeagueViewProtocol: AnyObject{
    var presenter: PremierLeaguePresenterProtocol?{get set}
}

protocol PremierLeaguePresenterProtocol:AnyObject{
     var view: PremierLeagueViewProtocol?{get set}
}

protocol PremierLeagueRouterProtocol {
    
}

// Interactor

protocol  PremierLeagueInteractorInputProtocol {
    var presenter: PremierLeagueInteractorOutputProtocol?{get set}
}

protocol  PremierLeagueInteractorOutputProtocol:AnyObject {
    
}
