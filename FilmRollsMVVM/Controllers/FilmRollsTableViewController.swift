//
//  FilmRollsTableViewController.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/18/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import UIKit
import RealmSwift

final class FilmRollsTableViewController: UITableViewController {
  
  // MARK: - Properties
  private let dataManager: FilmRollsDataManager
  private let viewModel = FilmRollsTableViewModel()
  
  // MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    configureNavBarButtonItems()
  }
  
  // MARK: - Init
  init(dataManager: FilmRollsDataManager) {
    self.dataManager = dataManager
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) { fatalError("Not implemented") }
}

// MARK: - Configuration
extension FilmRollsTableViewController {
  private func configureTableView() {
    title = "Film Rolls"
    tableView.register(FilmRollCell.classForCoder(), forCellReuseIdentifier: FilmRollCell.identifier)
    tableView.dataSource = viewModel
  }
  
  private func configureNavBarButtonItems() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(onAddButtonTapped))
  }
}

// MARK: - Action
extension FilmRollsTableViewController {
  @objc func onAddButtonTapped() {
    let controller = AddFilmRollController()
    controller.onFilmRollAdded = self.onFilmRollAdded
    present(UINavigationController(rootViewController: controller), animated: true)
  }
  
  private func onFilmRollAdded(filmRoll: FilmRoll) {
    dataManager.save(filmRoll: filmRoll) {
      self.tableView.reloadData()
    }
  }
}
