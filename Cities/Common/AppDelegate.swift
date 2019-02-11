//
//  AppDelegate.swift
//  Cities
//
//  Created by Judar Lima on 05/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        MainCoordinator.shared.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainCoordinator.shared.navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

