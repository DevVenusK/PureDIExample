//
//  AppDelegate.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import UIKit

import Pure

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let dependency: AppDependency
    var window: UIWindow?
    
    private override init() {
        self.dependency = AppDependency.resolve()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = self.dependency.window
        window?.makeKeyAndVisible()
        return true
    }
}

