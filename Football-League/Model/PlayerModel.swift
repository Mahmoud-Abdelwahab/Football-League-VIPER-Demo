//
//  PlayerModel.swift
//  Football-League
//
//  Created by Mahmoud Abdul-Wahab on 03/07/2021.
//

import Foundation

// MARK: - Player
struct Player: Codable {
    let id: Int?
    let name, position: String?
    let dateOfBirth: Date?
    let countryOfBirth, nationality: String?
    let shirtNumber: Int?
    let role: String?
}
