//
//  FilmRollsController.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/18/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import UIKit

final class FilmRollsController: UITableViewController {

  var tableData: [FilmRollViewModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    makeMockTableData()
  }

  // MARK: - Configuration
  private func configureTableView() {
    tableView.register(FilmRollCell.classForCoder(), forCellReuseIdentifier: FilmRollCell.identifier)
  }
  
}

// MARK: - Data Source
extension FilmRollsController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FilmRollCell.identifier, for: indexPath)
    
    if let cell = cell as? FilmRollCell {
      let viewModel = tableData[indexPath.row]
      cell.configure(viewModel)
    }
    
    return cell
  }
}

// MARK: - Navigation Bar Configuration
extension FilmRollsController {
//  private func configureNavigationBar() {
//    navigationController?.navigationBar.
//  }
}

// MARK: - Mock Data Generation
extension FilmRollsController {
  private func makeMockTableData() {
    tableData = [
      FilmRollViewModel(filmRoll: FilmRoll(name: "Kodak Portra 400", speed: 400, exposureCount: .twentyFour, type: .color)),
      FilmRollViewModel(filmRoll: FilmRoll(name: "Kodak Tri-X 200", speed: 200, exposureCount: .thirtySix , type: .bw))
    ]
  }
}
