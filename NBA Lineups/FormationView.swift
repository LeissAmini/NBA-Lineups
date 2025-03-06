//
//  FormationView.swift
//  NBA Lineups
//
//  Created by Leiss Amini on 1/1/25.
//

import SwiftUI

struct BasketballFormationView: View {
    let team: Team

    var body: some View {
        VStack {
            Text(team.name)
                .font(.headline)

            if team.players.isEmpty {
                Text("Lineups not out yet")
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .padding()
            } else {
                ForEach(team.players) { player in
                    HStack {
                        Text(player.name)
                            .font(.subheadline)
                        Spacer()
                        if let position = player.position {
                            Text(position)
                                .font(.caption)
                                .foregroundColor(.primary)
                        } else {
                            Text("-")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
    }
}

