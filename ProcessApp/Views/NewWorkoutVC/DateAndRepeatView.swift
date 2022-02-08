//
//  DataAndRepeatView.swift
//  ProcessApp
//
//  Created by developer on 31.01.2022.
//

import UIKit

class DataAndRepeatView: UIView {

  private let dateLabel: UILabel = {
    let label = UILabel()
    label.text = "Date"
    label.textColor = .specialGray
    label.font = .robotoMedium18()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let datePicker: UIDatePicker = {
    let datePicker = UIDatePicker()
    datePicker.datePickerMode = .date
    datePicker.tintColor = .specialGreen
    datePicker.translatesAutoresizingMaskIntoConstraints = false
    return datePicker
  }()

  private let repeatLabel: UIView = {
    let label = UILabel()
    label.text = "Reps or timer"
    label.textColor = .specialGray
    label.font = .robotoMedium18()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let repeatSwitch: UISwitch = {
    let repeatSwitch = UISwitch()
    repeatSwitch.isOn = true
    repeatSwitch.onTintColor = .specialGreen
    repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
    return repeatSwitch
  }()

  var dateStackView = UIStackView()
  var repeatStackView = UIStackView()

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupViews()
    setConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    backgroundColor = .specialBrown
    layer.cornerRadius = 10
    translatesAutoresizingMaskIntoConstraints = false

    dateStackView = UIStackView(arrangedSubviews: [dateLabel,datePicker],
                                axis: .horizontal,
                                spacing: 10)
    addSubview(dateStackView)

    repeatStackView = UIStackView(arrangedSubviews: [repeatLabel, repeatSwitch],
                                  axis: .horizontal,
                                  spacing: 10)

    addSubview(repeatStackView)
  }

  private func setConstraints() {
    NSLayoutConstraint.activate([
      dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
    ])
    NSLayoutConstraint.activate([
      repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
      repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
    ])
  }

}
