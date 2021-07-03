//
//  TeamModel.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Foundation

// MARK: - Team
struct Team: Codable {
    let id: Int?
    let name, shortName: String?
    let crestURL: String?
    let address, phone: String?
    let website: String?
    let email: String?
    let founded: Int?
    let clubColors, venue: String?
    let squad: [Player]?

    enum CodingKeys: String, CodingKey {
        case id, name, shortName
        case crestURL = "crestUrl"
        case address, phone, website, email, founded, clubColors, venue, squad
    }
}


