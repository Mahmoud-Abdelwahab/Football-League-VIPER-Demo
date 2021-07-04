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
    let shirtNumber: Int?
}


struct PlayerVM{
    let id,shirtNumber: Int?
    let name: String?
    let position: String?
    init(player: Player) {
        self.id          = player.id
        self.name        = player.name
        self.position    = player.position
        self.shirtNumber = player.shirtNumber
    }
}


