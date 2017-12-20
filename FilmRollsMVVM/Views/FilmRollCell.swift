//
//  FilmRollCell.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/18/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import UIKit

final class FilmRollCell: UITableViewCell {
  
  // MARK: - Properties
  private lazy var headerLabel = UILabel()
  private lazy var subtitleOneLabel = UILabel()
  private lazy var subtitleTwoLabel = UILabel()
  
  // MARK: - Init
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder aDecoder: NSCoder) { fatalError() }
  
  // MARK: - Configuration
  func configure(_ viewModel: FilmRollCellViewModel) {
    headerLabel.text = viewModel.name
    subtitleOneLabel.text = viewModel.speed
    subtitleTwoLabel.text = viewModel.dateCreated
  }
}

// MARK: - Identifier
extension FilmRollCell: CellIdentifiable { }

// MARK: - UI Configuration
extension FilmRollCell {
  
  private func configureUI() {
    configureLabels()
    
    [headerLabel, subtitleOneLabel, subtitleTwoLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
      headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
      subtitleOneLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 2),
      subtitleOneLabel.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
      subtitleTwoLabel.leadingAnchor.constraint(equalTo: subtitleOneLabel.leadingAnchor),
      subtitleTwoLabel.topAnchor.constraint(equalTo: subtitleOneLabel.bottomAnchor, constant: 2),
      subtitleTwoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
    ])
  }
  
  private func configureLabels() {
    headerLabel.font = .systemFont(ofSize: 17, weight: .semibold)
    headerLabel.textColor = .black
    subtitleOneLabel.font = .systemFont(ofSize: 13, weight: .regular)
    subtitleOneLabel.textColor = .black
    subtitleTwoLabel.font = .systemFont(ofSize: 13, weight: .regular)
    subtitleTwoLabel.textColor = .gray
  }
}
