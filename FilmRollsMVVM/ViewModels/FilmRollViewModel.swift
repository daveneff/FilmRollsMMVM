//
//  FilmRollViewModel.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/18/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import Foundation

struct FilmRollViewModel {
  var name: String
  var speed: String
  var numberOfExposures: String
  var dateCreated: String
  
  init(filmRoll: FilmRoll) {
    self.name = filmRoll.name
    self.speed = "ISO \(filmRoll.speed)"
    self.numberOfExposures = "\(filmRoll.exposureCount.rawValue)"
    
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d, Y"
    let dateCreatedString = formatter.string(from: filmRoll.dateCreated)
    self.dateCreated = "Created on \(dateCreatedString)"
  }
}

