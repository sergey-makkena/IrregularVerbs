//
//  AppDelegate.swift
//  Verbs
//
//  Created by Мустафаев Сергей Игоревич on 31.10.2020.
//  Copyright © 2020 Sergey Mustafaev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let initializer = MainModuleInitializer()

        window = UIWindow.init(frame: UIScreen.main.bounds)
        window!.backgroundColor = UIColor.white
        window!.rootViewController = UINavigationController(rootViewController: initializer.mainViewController)
        window!.makeKeyAndVisible()



        return true
    }

}

