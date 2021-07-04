//
//  TeamModel.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Foundation

// MARK: - Team
struct TeamList: Codable {
        let teams: [Team]?
    }
struct Team: Codable {
    let id: Int?
    let name, shortName: String?
    let crestURL: String?
    let address: String?
    let website: String?
    let squad: [Player]?

    enum CodingKeys: String, CodingKey {
        case id, name, shortName
        case crestURL = "crestUrl"
        case address, website, squad
    }
}

struct TeamListVM{
    let id: Int?
    let name: String?
    let address: String?
    let website: URL?
    let teamLogo: URL?
    init(team: Team) {
        self.id = team.id
        self.name = team.shortName
        self.teamLogo  = URL(string: team.crestURL ?? "")
        self.address   = team.address
        self.website   =  URL(string: team.website ?? "")
    }
}


