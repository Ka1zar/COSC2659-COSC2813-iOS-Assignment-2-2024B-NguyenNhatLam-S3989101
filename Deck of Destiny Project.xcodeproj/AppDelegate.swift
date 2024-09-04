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

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let isDarkTheme = UserDefaults.standard.bool(forKey: "isDarkTheme")
        window?.overrideUserInterfaceStyle = isDarkTheme ? .dark : .light
        return true
    }
}
