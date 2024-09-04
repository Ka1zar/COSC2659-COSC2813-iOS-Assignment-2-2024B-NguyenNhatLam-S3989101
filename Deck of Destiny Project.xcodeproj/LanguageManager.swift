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

class LanguageManager {
    static let shared = LanguageManager()
    
    private init() {}
    
    func setLanguage(language: String) {
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
        // Reload the root view controller to apply the language change
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        }
    }
    
    func getCurrentLanguage() -> String {
        let languages = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String]
        return languages?.first ?? "en"
    }
}
