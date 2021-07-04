//
//  UIIViewController+EX.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//

import UIKit

extension UIViewController{
    
    //MARK:- ALert
    func showAlert(title: String, message: String) {
       let alertController = UIAlertController(title: title, message:
         message, preferredStyle: .alert)
       alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
       }))
       self.present(alertController, animated: true, completion: nil)
     }
    
    //MARK:- Activity indecator

    var activityIndicatorTag: Int { return 999999 }

    func startActivityIndicator(
        style: UIActivityIndicatorView.Style = UIActivityIndicatorView.Style.large,
        location: CGPoint? = nil) {
        let loc = location ?? self.view.center
        DispatchQueue.main.async {
            let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            activityIndicator.tag = self.activityIndicatorTag
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            activityIndicator.color = #colorLiteral(red: 0, green: 0.01387289073, blue: 0.2176651955, alpha: 1)
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        }
    }


    func stopActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else{return}
            if let activityIndicator = self.view.subviews.filter(
            { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
       }
}

