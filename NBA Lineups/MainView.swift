//
//  MainView.swift
//  NBA Lineups
//
//  Created by Leiss Amini on 12/11/24.
//

import SwiftUI

struct MainView: View {
        @ObservedObject var networkManager = NetworkManager()
        
        var body: some View {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(networkManager.games) { game in
                            GameCardView(game: game)
                        }
                    }
                    .padding()
                }
                .navigationTitle("NBA Lineups")
                .onAppear {
                    networkManager.fetchGames()
                }
            }
        }
    }


struct GameCardView: View {
    let game: Game

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(game.teams.home.name) vs \(game.teams.away.name)")
                .font(.headline)

            Text("Tip-off: \(game.gameInfo.tipOffTime) on \(game.gameInfo.date)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Divider()

            HStack(alignment: .top) {
                TeamLineupView(team: game.teams.home, title: "Home Lineup:")
                Spacer()
                TeamLineupView(team: game.teams.away, title: "Away Lineup:")
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

struct TeamLineupView: View {
    let team: Team
    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .bold()

            if team.hasLineup {
                ForEach(team.players) { player in
                    Text("\(player.name) - \(player.position ?? "-")")
                }
            } else {
                Text(team.lineupStatusMessage)
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
        }
    }
}
