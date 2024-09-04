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

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Adding a logo image at the top
        let logoImageView = UIImageView(image: UIImage(named: "GameLogo")) // Replace with your image name
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.frame = CGRect(x: 50, y: 100, width: 300, height: 200) // Adjust frame as needed
        view.addSubview(logoImageView)

        setupUI()
    }

    func setupUI() {
        // Set background color
        view.backgroundColor = .white
        
        // Create a label for the game title
        let titleLabel = UILabel()
        titleLabel.text = "Deck of Destiny"
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        if GameData.shared.loadGameState() != nil {
            let continueButton = createButton(title: "Continue", action: #selector(continueGame))
            // Add the button to the view hierarchy
            // Adjust constraints and layout
        }
        
        // Create buttons for navigation
        let gameButton = createButton(title: "Play Game", action: #selector(startGame))
        let leaderboardButton = createButton(title: "Leaderboard", action: #selector(showLeaderboard))
        let howToPlayButton = createButton(title: "How To Play", action: #selector(showHowToPlay))
        let settingsButton = createButton(title: "Settings", action: #selector(showSettings))
        
        // Add buttons to the view
        let stackView = UIStackView(arrangedSubviews: [gameButton, leaderboardButton, howToPlayButton, settingsButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50)
        ])
    }

    func createButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    @objc func startGame() {
        // Navigate to Game View
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }

    @objc func showLeaderboard() {
        // Navigate to Leaderboard View
        let leaderboardVC = LeaderboardViewController()
        navigationController?.pushViewController(leaderboardVC, animated: true)
    }

    @objc func showHowToPlay() {
        // Navigate to How To Play View
        let howToPlayVC = HowToPlayViewController()
        navigationController?.pushViewController(howToPlayVC, animated: true)
    }

    @objc func showSettings() {
        // Navigate to Settings View
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }

    @objc func continueGame() {
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
}
