//
//  AppDelegate.swift
//  WatchDog
//
//  Created by Sam DuBois on 11/10/18.
//  Copyright © 2018 Holme Computer. All rights reserved.
//

import UIKit
import HealthKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let healthKitStore: HKHealthStore = HKHealthStore()
    
    func startObservingHeartBeatChanges() {
        
        let sampleType =  HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)
        
        let query: HKObserverQuery = HKObserverQuery(sampleType: sampleType!, predicate: nil) { (query, completionHandler, error) in
            
            if error != nil {
                
                // Perform Proper Error Handling Here...
                print("*** An error occured while setting up the stepCount observer. \(String(describing: error?.localizedDescription)) ***")
                abort()
            }
            self.heartBeatChangedHandler(query: query, completionHandler: completionHandler, error: error as NSError?)
            
        }
        
        healthKitStore.execute(query)
        healthKitStore.enableBackgroundDelivery(for: sampleType!, frequency: .immediate, withCompletion: {(succeeded: Bool, error: NSError!) in
            
            if succeeded{
                print("Enabled background delivery of weight changes")
            } else {
                if let theError = error{
                    print("Failed to enable background delivery of weight changes. ")
                    print("Error = \(theError)")
                }
            }
            } as! (Bool, Error?) -> Void)
    }
    
    
    func heartBeatChangedHandler(query: HKObserverQuery!, completionHandler: HKObserverQueryCompletionHandler!, error: NSError!) {
        
        // Here you need to call a function to query the height change
        
        // Send the notification to the user
        let content = UNMutableNotificationContent()
        content.title = "Weekly Staff Meeting"
        content.body = "Every Tuesday at 2pm"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                // Handle any errors.
            }

        completionHandler()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: .Alert | .Badge | .Sound, categories: nil))
        
        if HKHealthStore.isHealthDataAvailable() {
            // Add code to use HealthKit here.
            let healthStore = HKHealthStore()
            
            let allTypes = Set([HKObjectType.workoutType(),
                                HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                                HKObjectType.quantityType(forIdentifier: .distanceCycling)!,
                                HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
                                HKObjectType.quantityType(forIdentifier: .heartRate)!])
            
            healthStore.requestAuthorization(toShare: allTypes, read: allTypes) { (success, error) in
                if !success {
                    // Handle the error here.
                } else {
                    self.startObservingHeartBeatChanges()
                }
            }
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


}

}
