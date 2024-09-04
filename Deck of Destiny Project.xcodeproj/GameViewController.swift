/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2024B
  Assessment: Assignment 2
  Author: Nguyen Nhat Lam
  ID: S3989101
  Created  date: 15/08/2024
  Last modified: 04/09/2024
  Acknowledgement: Acknowledge the resources that you use here. 
*/

import UIKit

class GameViewController: UIViewController {

    var currentScoreLabel: UILabel!
    var gameBoardView: UIView!
    var gameOverLabel: UILabel!
    var gameState: GameState!
    
    var score = 0 {
        didSet {
            currentScoreLabel.text = "Score: \(score)"
        }
    }

    let themeSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        if let savedState = GameData.shared.loadGameState() {
            gameState = savedState
            resumeGame()
        } else {
            startNewGame()
        }
    }

    func setupUI() {
        view.backgroundColor = .white

        // Current Score Label
        currentScoreLabel = UILabel()
        currentScoreLabel.text = "Score: 0"
        currentScoreLabel.font = UIFont.systemFont(ofSize: 24)
        currentScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentScoreLabel)

        // Game Board View
        gameBoardView = UIView()
        gameBoardView.backgroundColor = UIColor.systemGray5
        gameBoardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gameBoardView)

        // Game Over Label
        gameOverLabel = UILabel()
        gameOverLabel.text = "Game Over!"
        gameOverLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        gameOverLabel.textColor = .red
        gameOverLabel.textAlignment = .center
        gameOverLabel.alpha = 0
        gameOverLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gameOverLabel)

        // Add the theme switch
        themeSwitch.isOn = UserDefaults.standard.bool(forKey: "isDarkTheme")
        themeSwitch.addTarget(self, action: #selector(toggleTheme), for: .valueChanged)
        // Add the switch to the view hierarchy
        // Adjust constraints and layout

        // Setup Constraints
        NSLayoutConstraint.activate([
            currentScoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            currentScoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            gameBoardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameBoardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gameBoardView.widthAnchor.constraint(equalToConstant: 300),
            gameBoardView.heightAnchor.constraint(equalToConstant: 400),
            
            gameOverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameOverLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func startGame() {
        // Initialize game logic here
        score = 0
        gameOverLabel.alpha = 0
    }

    func startNewGame() {
        gameState = GameState(score: 0, currentLevel: 1)
        loadLevel(level: gameState.currentLevel)
    }

    func loadLevel(level: Int) {
        // Adjust difficulty settings based on the level
        switch level {
        case 1:
            // Easy level settings
            break
        case 2:
            // Medium level settings
            break
        case 3:
            // Hard level settings
            break
        default:
            // Higher levels
            break
        }
    }

    func resumeGame() {
        // Resume game using `gameState`
    }

    func endGame() {
        // Display game over message
        UIView.animate(withDuration: 1.0) {
            self.gameOverLabel.alpha = 1.0
        }
    }

    @objc func playerAction() {
        // Update game state during gameplay
        gameState.score += 10

        // Save game state on significant changes
        GameData.shared.saveGameState(gameState)

        if gameState.score >= 100 {
            endGame()
        }

        if shouldAdvanceToNextLevel() {
            advanceToNextLevel()
        }

        GameData.shared.saveGameState(gameState)
    }

    func shouldAdvanceToNextLevel() -> Bool {
        // Level advancement based on score
        return gameState.score >= 100 
    }

    func advanceToNextLevel() {
        gameState.currentLevel += 1
        loadLevel(level: gameState.currentLevel)
    }

    @objc func toggleTheme() {
        let isDark = themeSwitch.isOn
        UserDefaults.standard.set(isDark, forKey: "isDarkTheme")
        applyTheme(isDark: isDark)
    }

    func applyTheme(isDark: Bool) {
        view.window?.overrideUserInterfaceStyle = isDark ? .dark : .light
        // Update the theme for all views
    }

}

