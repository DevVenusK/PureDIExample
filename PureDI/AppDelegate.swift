//
//  AppDelegate.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let dependency: AppDependency
    var window: UIWindow?
    
    private override init() {
        self.dependency = AppDependency.resolve()
        super.init()
    }
    
    init(dependency: AppDependency) {
        self.dependency = dependency
        super.init()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

