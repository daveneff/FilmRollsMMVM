//
//  FilmRollsTableViewModel.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/19/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import Foundation
import RealmSwift

struct FilmRollsDataManager {
  
  let realm: Realm
  
}

// MARK: - Saving
extension FilmRollsDataManager {
  func save(filmRoll: FilmRoll, completion: (() -> Void)? = nil) {
    do {
      try realm.write {
        realm.add(filmRoll)
        completion?()
      }
    } catch {
      fatalError("Writing to Realm failed")
    }
  }
}
