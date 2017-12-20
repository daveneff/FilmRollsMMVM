//
//  AddFilmRollController.swift
//  FilmRollsMVVM
//
//  Created by David Neff on 12/19/17.
//  Copyright © 2017 Dave Neff. All rights reserved.
//

import UIKit

final class AddFilmRollController: UIViewController {
  
  // MARK: - Properties
  lazy var nameTextField = UITextField()
  lazy var exposuresTextField = UITextField()
  lazy var speedTextField = UITextField()
  lazy var typeTextField = UITextField()
  lazy var button = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 40))
  
  // MARK: - Callback
  var onFilmRollAdded: ((FilmRoll) -> Void)?
  
  // MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    configureModalDismissNavBarButton()
  }
}

// MARK: - Action
extension AddFilmRollController {
  
  @objc func onAddButtonTapped() {
    let name = nameTextField.text ?? "Default Camera Name"
    let speed = Int(speedTextField.text ?? "") ?? 400
    let exposureCount = Int(exposuresTextField.text ?? "") ?? 24
    let type = typeTextField.text ?? "Default: Black & White"

    let filmRoll = FilmRoll(name: name,
                            speed: speed,
                            exposureCount: exposureCount,
                            type: type)

    onFilmRollAdded?(filmRoll)

    self.dismiss(animated: true)
  }
}

// MARK: - UI Configuartion
extension AddFilmRollController {
  
  private func configureUI() {
    title = "Add New Film Roll"
    view.backgroundColor = .lightGray
    configureTextFields()
    configureButton()
  }
  
  private func configureTextFields() {
    nameTextField.placeholder = "Film Roll Name"
    exposuresTextField.placeholder = "Exposure Count (Ex: 24)"
    speedTextField.placeholder = "Speed (Ex: 400)"
    typeTextField.placeholder = "Film Type (Ex: Black & White)"
    
    [nameTextField, exposuresTextField, speedTextField, typeTextField].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.backgroundColor = .white
      $0.textAlignment = .center
      NSLayoutConstraint.activate([
        $0.heightAnchor.constraint(equalToConstant: 40),
        $0.widthAnchor.constraint(equalToConstant: view.frame.width * 0.70),
        $0.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    NSLayoutConstraint.activate([
      nameTextField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
      exposuresTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
      speedTextField.topAnchor.constraint(equalTo: exposuresTextField.bottomAnchor, constant: 20),
      typeTextField.topAnchor.constraint(equalTo: speedTextField.bottomAnchor, constant: 20)
      ])
    
    exposuresTextField.keyboardType = .numberPad
    speedTextField.keyboardType = .numberPad
  }
  
  private func configureButton() {
    view.addSubview(button)
    button.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Add", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .blue
    
    NSLayoutConstraint.activate([
      button.topAnchor.constraint(equalTo: typeTextField.bottomAnchor, constant: 20),
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.widthAnchor.constraint(equalToConstant: view.frame.width * 0.20)
      ])
  }
}
