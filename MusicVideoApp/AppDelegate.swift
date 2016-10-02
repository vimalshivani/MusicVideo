//
//  AppDelegate.swift
//  MusicVideoApp
//
//  Created by Kumar, Vimal on 28/09/16.
//  Copyright © 2016 Kumar, Vimal. All rights reserved.
//

import UIKit

var reachibility : Reachability?

var reachibilityStatus = WIFI



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var internetCheck : Reachability?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
      NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityChanged:", name: kReachabilityChangedNotification, object: nil)
        
        internetCheck = Reachability.reachabilityForInternetConnection()
        
       internetCheck?.startNotifier()
        
        return true
    }
    
    func reachabilityChanged(notification: NSNotification)
    {
        
        
        reachibility = notification.object as? Reachability
        statusChangedWithReachability(reachibility!)
        
    }
    
    func statusChangedWithReachability(status : Reachability)
    {
        
        
        
        let networkStatus : NetworkStatus = status.currentReachabilityStatus()
        
        switch networkStatus.rawValue
        {
        case NotReachable.rawValue : reachibilityStatus = NONE
        case ReachableViaWiFi.rawValue : reachibilityStatus = WIFI
        case ReachableViaWWAN.rawValue : reachibilityStatus = CELLULAR
        default:return
            
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("ReachStatusChanged", object: nil)    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
      
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kReachabilityChangedNotification, object: nil)
    }


}

