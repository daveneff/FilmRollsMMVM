//
//  Date+Extensions.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/19/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import Foundation

extension Date {
  public var prettyDate: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d, yyyy h:mm a"
    return formatter.string(from: self)
  }
}
