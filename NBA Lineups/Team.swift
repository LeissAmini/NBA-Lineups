//
//  Team.swift
//  NBA Lineups
//
//  Created by Leiss Amini on 12/11/24.
//


import Foundation

struct Team: Identifiable, Decodable {
    let id: UUID = UUID()
    let name: String
    let record: String
    let players: [Player]

    var hasLineup: Bool {
        !players.isEmpty && players.first?.name != "Lineup not available yet"
    }

    var lineupStatusMessage: String {
        hasLineup ? "" : "Lineup not available yet"
    }

    private enum CodingKeys: String, CodingKey {
        case name, record, players
    }
}
