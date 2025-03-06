//
//  NetworkManager.swift
//  NBA Lineups
//
//  Created by Leiss Amini on 12/11/24.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var games: [Game] = []

    func fetchGames() {
        guard let url = URL(string: "http://127.0.0.1:8000/") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode([String: [Game]].self, from: data)
                DispatchQueue.main.async {
                    self.games = decodedResponse["games"] ?? []
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
