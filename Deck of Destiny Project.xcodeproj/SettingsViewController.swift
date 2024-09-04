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

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let difficultyLevels = ["Easy", "Medium", "Hard"]
    let languages = ["English", "Vietnamese"]
    
    var difficultyPicker: UIPickerView!
    var languagePicker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white

        // Difficulty Picker
        difficultyPicker = UIPickerView()
        difficultyPicker.delegate = self
        difficultyPicker.dataSource = self
        difficultyPicker.tag = 1
        difficultyPicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(difficultyPicker)
        
        // Language Picker
        languagePicker = UIPickerView()
        languagePicker.delegate = self
        languagePicker.dataSource = self
        languagePicker.tag = 2
        languagePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(languagePicker)

        // Setup Constraints
        NSLayoutConstraint.activate([
            difficultyPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            difficultyPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
            languagePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            languagePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        ])
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView.tag == 1 ? difficultyLevels.count : languages.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerView.tag == 1 ? difficultyLevels[row] : languages[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            // Handle difficulty level change
            let selectedDifficulty = difficultyLevels[row]
            print("Selected Difficulty: \(selectedDifficulty)")
            // Update game settings with the selected difficulty
            // This could involve updating a settings model or UserDefaults
        } else if pickerView.tag == 2 {
            // Handle language change
            let selectedLanguage = languages[row]
            print("Selected Language: \(selectedLanguage)")
            // Update language preference
            // This could involve reloading localized strings or switching language packs
        }
    }
}

