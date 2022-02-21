//
//  RepsOrTimerView.swift
//  ProcessApp
//
//  Created by developer on 31.01.2022.
//

import UIKit

class RepsOrTimerView : UIView {

  private let setsLabel: UILabel = {
    let label = UILabel()
    label.text = "Sets"
    label.textColor = .specialGray
    label.font = .robotoMedium18()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let numberOfSetsLabel: UILabel = {
    let label = UILabel()
    label.text = "1"
    label.textColor = .specialGray
    label.font = .robotoMedium24()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let setsSlider: UISlider = {
    let slider = UISlider()
    slider.minimumValue = 1
    slider.maximumValue = 50
    slider.maximumTrackTintColor = .specialLightBrown
    slider.minimumTrackTintColor = .specialGreen
    slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
    return slider
  }()

  private let chooseLabel: UILabel = {
    let label = UILabel()
    label.text = "Choose repeat or timer"
    label.textColor = .specialLightBrown
    label.font = .robotoMedium14()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let repsLabel: UILabel = {
    let label = UILabel()
    label.text = "Reps"
    label.textColor = .specialGray
    label.font = .robotoMedium18()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let numbersOfRepsLabel: UILabel = {
    let label = UILabel()
    label.text = "2"
    label.textColor = .specialGray
    label.font = .robotoMedium24()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let repsSlider: UISlider = {
    let slider = UISlider()
    slider.minimumValue = 1
    slider.maximumValue = 10
    slider.maximumTrackTintColor = .specialLightBrown
    slider.minimumTrackTintColor = .specialGreen
    slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
    return slider
  }()

  private let timerLabel: UILabel = {
    let label = UILabel()
    label.text = "Timer"
    label.textColor = .specialLightBrown
    label.font = .robotoMedium18()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let numberOfTimerLabel: UILabel = {
    let label = UILabel()
    label.text = "0 min"
    label.textColor = .specialGray
    label.font = .robotoMedium18()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let timerSlider: UISlider = {
    let slider = UISlider()
    slider.minimumValue = 1
    slider.maximumValue = 10
    slider.maximumTrackTintColor = .specialLightBrown
    slider.minimumTrackTintColor = .specialGreen
    slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
    return slider
  }()

  var setsStackView = UIStackView()
  var repsStackView = UIStackView()
  var timerStackView = UIStackView()

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

    setsStackView = UIStackView(arrangedSubviews: [setsLabel, numberOfSetsLabel],
                                axis: .horizontal,
                                spacing: 10)
    addSubview(setsStackView)
    addSubview(setsSlider)
    addSubview(chooseLabel)

    repsStackView = UIStackView(arrangedSubviews: [repsLabel, numbersOfRepsLabel],
                                axis: .horizontal,
                                spacing: 10)
    addSubview(repsStackView)
    addSubview(repsSlider)

    timerStackView = UIStackView(arrangedSubviews: [timerLabel, numberOfTimerLabel],
                                 axis: .horizontal,
                                 spacing: 10)
    addSubview(timerStackView)
    addSubview(timerSlider)
  }

  @objc private func setsSliderChanged() {
    numberOfSetsLabel.text = "\(Int(setsSlider.value))"
  }

  @objc private func repsSliderChanged() {
      numbersOfRepsLabel.text = "\(Int(repsSlider.value))"
  }

  @objc private func timerSliderChanged() {
    numberOfTimerLabel.text = "\(Int(timerSlider.value))"
  }

  private func setConstraints() {
    NSLayoutConstraint.activate([
      setsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 23),
      setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
    ])
    NSLayoutConstraint.activate([
      setsSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 16),
      setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
    ])
    NSLayoutConstraint.activate([
      chooseLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 32),
      chooseLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
    NSLayoutConstraint.activate([
      repsStackView.topAnchor.constraint(equalTo: chooseLabel.bottomAnchor, constant: 5),
      repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
    ])
    NSLayoutConstraint.activate([
      repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 19),
      repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
    ])
    NSLayoutConstraint.activate([
      timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 26),
      timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
    ])
    NSLayoutConstraint.activate([
      timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 19),
      timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
    ])
  }




  
}
