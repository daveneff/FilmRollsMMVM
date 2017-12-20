//
//  FilmRollViewModel.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/18/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import Foundation

struct FilmRollCellViewModel {
  var name: String
  var speed: String
  var numberOfExposures: String
  var dateCreated: String
  
  init(filmRoll: FilmRoll) {
    self.name = filmRoll.name
    self.speed = "ISO \(filmRoll.speed)"
    self.numberOfExposures = "\(filmRoll.exposureCount) exposures"
    self.dateCreated = "Created \(filmRoll.dateCreated.prettyDate)"
  }
}
