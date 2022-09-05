//
//  AppDelegate.swift
//  CodeTest
//
//  Created by Brines, Steve on 2/4/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let charactersVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateInitialViewController() as? CharactersVC
        charactersVC?.charactersVM = CharactersVM()
        window?.rootViewController = charactersVC
        window?.makeKeyAndVisible()
        return true
    }
}

