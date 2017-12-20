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
  private let realm: Realm
  private lazy var dataSource = FilmRollsDataSource(realm: realm)
  
  // MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    configureNavigationItems()
  }
  
  // MARK: - Init
  init(realm: Realm) {
    self.realm = realm
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) { fatalError("Not implemented") }
}

// MARK: - Configuration
extension FilmRollsTableViewController {
  private func configureTableView() {
    title = "Film Rolls"
    tableView.register(FilmRollCell.classForCoder(), forCellReuseIdentifier: FilmRollCell.identifier)
    tableView.dataSource = dataSource
  }
  
  private func configureNavigationItems() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(onAddButtonTapped))
  }
}

// MARK: - Action
extension FilmRollsTableViewController {
  @objc func onAddButtonTapped() {
    let vc = AddFilmRollController()
    vc.onFilmRollAdded = self.onFilmRollAdded
    let controller = UINavigationController(rootViewController: vc)
    present(controller, animated: true)
  }
  
  func onFilmRollAdded(filmRoll: FilmRoll) {
    dataSource.save(filmRoll: filmRoll) {
      self.tableView.reloadData()
    }
  }
}
