//
//  Player.swift
//  NBA Lineups
//
//  Created by Leiss Amini on 12/11/24.
//

import Foundation

struct Player: Identifiable, Decodable {
    let id: UUID = UUID()
    let name: String
    let position: String?

    private enum CodingKeys: String, CodingKey {
        case name, position
    }
}


