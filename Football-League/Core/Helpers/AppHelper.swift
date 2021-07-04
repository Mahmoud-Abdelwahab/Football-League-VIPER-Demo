//
//  AppHelper.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 04/07/2021.
//

import Foundation
import SafariServices

enum AppHelper{
    static func presentSafariVC (with url : URL,VC: UIViewController) {
         let safariVC = SFSafariViewController(url: url)
         safariVC.preferredControlTintColor = .systemGreen
        VC.present(safariVC , animated: true)
     }
}
