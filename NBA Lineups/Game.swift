//
//  Game.swift
//  NBA Lineups
//

import Foundation

struct Game: Identifiable, Decodable {
    let id: UUID = UUID()
    let gameInfo: GameInfo
    let teams: Teams

    private enum CodingKeys: String, CodingKey {
        case gameInfo, teams
    }
}

struct GameInfo: Decodable {
    let tipOffTime: String
    let date: String
}

struct Teams: Decodable {
    let home: Team
    let away: Team
}
