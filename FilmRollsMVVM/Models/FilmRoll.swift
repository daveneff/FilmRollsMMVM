//
//  FilmRoll.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/18/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import Foundation

struct FilmRoll {
  enum ExposureCount: Int {
    case twentyFour = 24
    case thirtySix = 36
  }
  
  enum FilmType: String {
    case color = "Color"
    case bw = "Black & White"
  }
  
  var name: String
  var speed: Int
  var exposureCount: ExposureCount
  var type: FilmType
  let dateCreated = Date()
}
