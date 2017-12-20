//
//  FilmRollsTableViewModel.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/19/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import UIKit
import RealmSwift

final class FilmRollsDataSource: NSObject {
  
  // MARK: - Properties
  private let realm: Realm
  private var tableData: [FilmRoll] {
    return Array(realm.objects(FilmRoll.self))
  }

  // MARK: - Init
  init(realm: Realm) {
    self.realm = realm
  }
}

// MARK: - Saving
extension FilmRollsDataSource {
  
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

// MARK: - Table view data source
extension FilmRollsDataSource: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }
  
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FilmRollCell.identifier, for: indexPath)
    let item = tableData[indexPath.row]
  
    if let cell = cell as? FilmRollCell {
      let viewModel = FilmRollCellViewModel(filmRoll: item)
      cell.configure(viewModel)
    }
  
    return cell
  }
}
