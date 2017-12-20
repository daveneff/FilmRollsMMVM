//
//  FilmRoll.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/18/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import Foundation
import RealmSwift

final class FilmRoll: Object {
  @objc dynamic var id: String = UUID().uuidString
  
  @objc dynamic var name: String = ""
  @objc dynamic var speed: Int = 0
  @objc dynamic var exposureCount: Int = 0
  @objc dynamic var type: String = "Not Available"
  @objc dynamic let dateCreated = Date()
  
  convenience init(name: String,
                   speed: Int,
                   exposureCount: Int,
                   type: String) {
    self.init()
    self.name = name
    self.speed = speed
    self.exposureCount = exposureCount
    self.type = type
  }
  
  override class func primaryKey() -> String {
    return "id"
  }
  
}

// TBD
enum ExposureCount: Int {
  case twentyFour = 24
  case thirtySix = 36
}

enum FilmType: String {
  case color = "Color"
  case bw = "Black & White"
}
