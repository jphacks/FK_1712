//
//  AppDelegate.swift
//  Availee-iOS
//
//  Created by maekawakazuma on 2017/10/28.
//  Copyright © 2017 fk_1712. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.09240212291, green: 0.8810169101, blue: 0.7510151267, alpha: 1)
        
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.08086351305, green: 0.165294081, blue: 0.2608318627, alpha: 1)
        
        if isRegisterd() {
            let main = UIStoryboard(name: "Main", bundle: nil)
            self.window?.rootViewController = main.instantiateInitialViewController()
        } else {
            let login = UIStoryboard(name: "Login", bundle: nil)
            self.window?.rootViewController = login.instantiateInitialViewController()
        }
        return true
    }
    
    private func isRegisterd() -> Bool{
        let userDefaults = UserDefaults.standard
        guard let _ = userDefaults.value(forKey: "name") else { return false }
        guard let _ = userDefaults.value(forKey: "icon") else { return false }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

