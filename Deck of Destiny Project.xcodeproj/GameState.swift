/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2024B
  Assessment: Assignment 2
  Author: Nguyen Nhat Lam
  ID: S3989101
  Created  date: 20/08/2024
  Last modified: 04/09/2024
  Acknowledgement: Acknowledge the resources that you use here. 
*/

import Foundation

struct GameState: Codable {
    var score: Int
    var currentLevel: Int
    // Add other necessary game state variables here
}

class GameData {
    static let shared = GameData()

    private let saveKey = "DeckOfDestinyGameState"

    func saveGameState(_ state: GameState) {
        if let encodedData = try? JSONEncoder().encode(state) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }

    func loadGameState() -> GameState? {
        if let savedData = UserDefaults.standard.data(forKey: saveKey),
           let decodedState = try? JSONDecoder().decode(GameState.self, from: savedData) {
            return decodedState
        }
        return nil
    }

    func clearGameState() {
        UserDefaults.standard.removeObject(forKey: saveKey)
    }
}
