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

class HowToPlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = "How to Play"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Instructions Label
        let instructionsLabel = UILabel()
        instructionsLabel.text = """
        1. Draw cards from the deck.
        2. Match cards to win points.
        3. Avoid traps and obstacles.
        4. The game ends when you run out of cards.
        """
        instructionsLabel.font = UIFont.systemFont(ofSize: 18)
        instructionsLabel.numberOfLines = 0
        instructionsLabel.textAlignment = .left
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(instructionsLabel)

        // Example Visual Aid (could be an image or animation)
        let exampleImageView = UIImageView(image: UIImage(named: "exampleCard"))
        exampleImageView.contentMode = .scaleAspectFit
        exampleImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exampleImageView)
        
        // Setup Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            instructionsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            instructionsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            exampleImageView.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 20),
            exampleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exampleImageView.widthAnchor.constraint(equalToConstant: 200),
            exampleImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
