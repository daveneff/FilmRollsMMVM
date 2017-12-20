//
//  CellIdentifiable.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/18/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import UIKit

//  Protocol which assigns a default unique identifier to any cell which adopts it
protocol CellIdentifiable where Self: UITableViewCell {
  static var identifier: String { get }
}

extension CellIdentifiable {
  static var identifier: String {
    return String(describing: self)
  }
}
