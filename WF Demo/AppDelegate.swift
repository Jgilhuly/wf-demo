//
//  AppDelegate.swift
//  WF Demo
//
//  Created by John Gilhuly on 8/10/20.
//  Copyright © 2020 John Gilhuly. All rights reserved.
//

import UIKit
import Branch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      // if you are in a Debug build, uncomment the line below this one
      // Branch.setUseTestBranchKey(true)
        
      // listener for Branch Deep Link data
      Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
        // do stuff with deep link data (nav to page, display content, etc)
        // You'll want to look for "+clicked_branch_link=true" and then use the "$canonical_url" value to route to a location in app
        print(params as? [String: AnyObject] ?? {})
      }
      return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return Branch.getInstance().application(app, open: url, options: options)
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
      // handler for Universal Links
        return Branch.getInstance().continue(userActivity)
    }
}

