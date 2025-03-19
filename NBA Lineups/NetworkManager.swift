//
//  NetworkManager.swift
//  NBA Lineups
//
//  Created by Leiss Amini on 12/11/24.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var games: [Game] = []
    var timer: Timer?

    func startFetchingGames() {
        // Ensure any previous timer is canceled
        stopFetchingGames()

        // Pre-wake the server before fetching data
        wakeUpServer {
            // Fetch data after waking up/
            self.fetchGames()
        }

        // Start a timer for periodic updates
        timer = Timer.scheduledTimer(withTimeInterval: determineFetchInterval(), repeats: true) { _ in
            self.fetchGames()
        }
    }

    func stopFetchingGames() {
        timer?.invalidate()
        timer = nil
    }

    private func wakeUpServer(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://nba-lineups-backend.onrender.com/") else { return }

        URLSession.shared.dataTask(with: url) { _, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Wake-up request failed: \(error.localizedDescription)")
                } else if let httpResponse = response as? HTTPURLResponse {
                    print("Wake-up request status: \(httpResponse.statusCode)")
                }
                completion() // Proceed to fetch data after waking up
            }
        }.resume()
    }

    func fetchGames() {
        guard let url = URL(string: "https://nba-lineups-backend.onrender.com/") else { return }

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

    private func determineFetchInterval() -> TimeInterval {
        let currentHour = Calendar.current.component(.hour, from: Date())

        if currentHour >= 18 && currentHour <= 23 {
            return 300 // 5 minutes (during critical pre-game window)
        } else if currentHour >= 16 && currentHour < 18 {
            return 600 // 10 minutes (before lineups start coming out)
        } else {
            return 3600 // 1 hour (non-game hours, rarely fetch)
        }
    }
}
