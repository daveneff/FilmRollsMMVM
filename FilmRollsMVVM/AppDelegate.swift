//
//  AppDelegate.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/18/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var realm: Realm!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow()

    do {
      realm = try Realm()
    } catch {
      fatalError("Realm instantiation failed")
    }
    print(realm.configuration.fileURL!)
    
    let rootViewController = FilmRollsTableViewController(realm: realm)
    window?.rootViewController = UINavigationController(rootViewController: rootViewController)
    window?.makeKeyAndVisible()
    
    return true
  }
}
