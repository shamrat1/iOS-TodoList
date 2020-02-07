//
//  AppDelegate.swift
//  TodoList
//
//  Created by Yasin Shamrat on 24/1/20.
//  Copyright © 2020 Yasin Shamrat. All rights reserved.
//

import UIKit
import UserNotifications
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//    let icons = ["calender","drink","flight","folder","meeting","photo","shopping","movie","bag","cake","gift"]


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print("isDataPreloaded : \(UserDefaults.standard.bool(forKey: "isDataPreloaded"))")
        
        if UserDefaults.standard.bool(forKey: "isDataPreloaded") != true{
            
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert,.badge,.sound]) { (granted, error) in
                if granted {
                    print("We have permission.")
                }else{
                    print("Permission Denied.")
                }
            }
            
            loadOnboarding()
            preloadData()
        }

    
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
    func loadOnboarding(){
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let vc = (storyboard.instantiateViewController(withIdentifier: "OnboardingMain") as? OnboardingViewController)!
        //        vc.modalPresentationStyle = .fullScreen
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
    }
    func preloadData(){
        
        let realm = try! Realm()
        // cat 1
        let catagory1 = Catagory()
        catagory1.id = 1
        catagory1.name = "Shopping"
        catagory1.icon = "shopping"
        // cat 2
        let catagory2 = Catagory()
        catagory2.id = 2
        catagory2.name = "Appointments"
        catagory2.icon = "meeting"
        // cat 3
        let catagory3 = Catagory()
        catagory3.id = 3
        catagory3.name = "Todo's"
        catagory3.icon = "calender"
        // cat 3
        let catagory4 = Catagory()
        catagory4.id = 4
        catagory4.name = "Movies"
        catagory4.icon = "movie"
        
        let catagories: [Catagory] = [catagory1,catagory2,catagory3,catagory4]
        for item in catagories{
            
            do{
                try realm.write {
                    realm.add(item)
                    print("Data preloaded.")
                }
            }catch{
                print("Error preloading Data.")
            }
        }
        UserDefaults.standard.set(true, forKey: "isDataPreloaded")
        
    }


}

