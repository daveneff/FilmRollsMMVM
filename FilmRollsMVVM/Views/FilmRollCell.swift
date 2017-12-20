//
//  FilmRollCell.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/18/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import UIKit

final class FilmRollCell: UITableViewCell {
  
  lazy var headerLabel = UILabel()
  lazy var subtitleLabel = UILabel()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder aDecoder: NSCoder) { fatalError() }
  
  func configure(_ viewModel: FilmRollCellViewModel) {
    headerLabel.text = viewModel.name
    subtitleLabel.text = viewModel.dateCreated
  }  
}

// MARK: - Configuration
extension FilmRollCell {
  private func configureUI() {
    configureLabels()
    
    [headerLabel, subtitleLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
      headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
      subtitleLabel.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
      subtitleLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 2),
      subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
    ])
  }
  
  private func configureLabels() {
    headerLabel.font = .systemFont(ofSize: 17, weight: .semibold)
    headerLabel.textColor = .black
    subtitleLabel.font = .systemFont(ofSize: 13, weight: .light)
    subtitleLabel.textColor = .gray
  }
}

// MARK: - Identifier
extension FilmRollCell: CellIdentifiable { }
