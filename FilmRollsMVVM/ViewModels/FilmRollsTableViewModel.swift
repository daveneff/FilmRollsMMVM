//
//  FilmRollsTableViewModel.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/21/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import UIKit
import RealmSwift

final class FilmRollsTableViewModel: NSObject {
  
  private let realm = try! Realm()
  
  private var tableData: [FilmRoll] {
    return Array(realm.objects(FilmRoll.self))
  }
  
}

// MARK: - Table view data source
extension FilmRollsTableViewModel: UITableViewDataSource {
  
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
