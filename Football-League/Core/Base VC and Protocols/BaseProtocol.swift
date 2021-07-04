//
//  Base.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//

import Foundation
protocol BaseRouter {
    func presentSafariVC (with url : URL)
    func showAlert(with title: String, message: String)
    func dismiss()
}

extension BaseRouter{
    func dismiss(){
        //emplty implementation for dismiss
    }
    
    func presentSafariVC (with url : URL){
        
    }
    
    func showAlert(with title: String, message: String){
        
    }
    
}
