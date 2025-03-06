//
//  LineupDetails.swift
//  NBA Lineups
//
//  Created by Leiss Amini on 1/1/25.
//

import Foundation

struct LineupDetails: Decodable {
    let team: String
    let players: [PlayerDetails]

    private enum CodingKeys: String, CodingKey {
        case team
        case players
    }
}

struct PlayerDetails: Decodable {
    let name: String
    let position: String
    let imageUrl: String?
}

