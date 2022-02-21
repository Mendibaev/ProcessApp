//
//  NewWorkoutViewController.swift
//  ProcessApp
//
//  Created by developer on 27.01.2022.
//

import UIKit

class NewWorkoutViewController: UIViewController {

  private let newWorkoutLabel: UILabel = {
    let label = UILabel()
    label.text = "NEW WORKOUT"
    label.textColor = .specialBlack
    label.font = .robotoMedium24()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let closeButton: UIButton = {
    let button = UIButton()
    button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    return button
  }()

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Name"
    label.textColor = .specialBrown
    label.font = .robotoMedium14()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let nameTextField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .specialBrown
    textField.borderStyle = .none
    textField.layer.cornerRadius = 10
    textField.textColor = .specialGray
    textField.font = .robotoBold20()
    textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
    textField.leftViewMode = .always
    textField.clearButtonMode = .always
    textField.returnKeyType = .next
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()

  private let dateAndRepeatLabel: UILabel = {
    let label = UILabel()
    label.text = "Date and repeat"
    label.textColor = .specialBrown
    label.font = .robotoMedium14()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let repsOrTimerLabel: UILabel = {
    let label = UILabel()
    label.text = "Reps or timer"
    label.textColor = .specialBrown
    label.font = .robotoMedium14()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let saveButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .specialGreen
    button.setTitle("SAVE", for: .normal)
    button.titleLabel?.font = .robotoBold16()
    button.tintColor = .white
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    return button
  }()
  
  private let dateAndRepeatView = DateAndRepeatView()
  private let repsOrTimerView = RepsOrTimerView()

  override func viewDidLayoutSubviews() {
    closeButton.layer.cornerRadius = closeButton.frame.height / 2
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupViews()
    setConstraints()
    setDelegates()
    addTaps()  

    nameTextField.becomeFirstResponder()

  }

  private func setupViews() {
    view.backgroundColor = .specialBackground

    view.addSubview(newWorkoutLabel)
    view.addSubview(closeButton)
    view.addSubview(nameLabel)
    view.addSubview(nameTextField)
    view.addSubview(dateAndRepeatLabel)
    view.addSubview(dateAndRepeatView)
    view.addSubview(repsOrTimerLabel)
    view.addSubview(repsOrTimerView)
    view.addSubview(saveButton)
  }

  private func setDelegates() {
    nameTextField.delegate = self
  }

  @objc private func closeButtonTapped() {
    dismiss(animated: true, completion: nil)
  }

  @objc private func saveButtonTapped() {
    print("saveButtonTapped")
  }

  private func addTaps() {
    let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    tapScreen.cancelsTouchesInView = false
    view.addGestureRecognizer(tapScreen)
  }

  @objc private func hideKeyboard() {
    view.endEditing(true)
  }
}



extension NewWorkoutViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    nameTextField.resignFirstResponder()
  }
}

//MARK: - SetConstraints

extension NewWorkoutViewController{
  private func setConstraints() {
    NSLayoutConstraint.activate([
      newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
      newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    NSLayoutConstraint.activate([
      closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
      closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
      closeButton.heightAnchor.constraint(equalToConstant: 30),
      closeButton.widthAnchor.constraint(equalToConstant: 30)
    ])
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
      nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
      nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -268)
    ])
    NSLayoutConstraint.activate([
      nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
      nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
      nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
      nameTextField.heightAnchor.constraint(equalToConstant: 38)
    ])
    NSLayoutConstraint.activate([
      dateAndRepeatLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 14),
      dateAndRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
      dateAndRepeatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -268)
    ])
    NSLayoutConstraint.activate([
      dateAndRepeatView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 1),
      dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
      dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
      dateAndRepeatView.heightAnchor.constraint(equalToConstant: 93)
    ])
    NSLayoutConstraint.activate([
      repsOrTimerLabel.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 20),
      repsOrTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
      repsOrTimerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -237)
    ])
    NSLayoutConstraint.activate([
      repsOrTimerView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 0),
      repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
      repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
      repsOrTimerView.heightAnchor.constraint(equalToConstant: 350)
    ])
    NSLayoutConstraint.activate([
      saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 25),
      saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      saveButton.widthAnchor.constraint(equalToConstant: 345),
      saveButton.heightAnchor.constraint(equalToConstant: 55)
    ])
  }
}
