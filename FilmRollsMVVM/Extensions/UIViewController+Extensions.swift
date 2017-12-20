//
//  UIViewController+Extensions.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/19/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import UIKit

extension UIViewController {
  func configureModalDismissNavBarButton() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(onDismissButtonTapped))
  }
  
  @objc func onDismissButtonTapped() {
    self.dismiss(animated: true)
  }
}
