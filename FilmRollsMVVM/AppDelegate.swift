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

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow()
    
    let rootViewController = FilmRollsTableViewController(dataManager: makeDataManager())
    window?.rootViewController = UINavigationController(rootViewController: rootViewController)
    window?.makeKeyAndVisible()
    
    return true
  }
}

// MARK: - Data manager factory
extension AppDelegate {
  private func makeDataManager() -> FilmRollsDataManager {
    do {
      let realm = try Realm()
      return FilmRollsDataManager(realm: realm)
    } catch {
      fatalError("Data manager instantiation failed")
    }
  }
}
