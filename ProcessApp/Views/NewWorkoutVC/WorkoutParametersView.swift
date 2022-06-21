//
//  WorkoutParametersView.swift
//  ProcessApp
//
//  Created by developer on 19.05.2022.
//

import UIKit

protocol NextSetProtocol: AnyObject {
  func nextSetTapped()
}

class WorkoutParametersView: UIView {

   let nameWorkout: UILabel = {
    let label = UILabel()
    label.text = "Biceps"
    label.textColor = .specialGray
    label.font = .robotoMedium24()
    label.textAlignment = .center
    label.adjustsFontSizeToFitWidth = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let setsLabel: UILabel = {
    let label = UILabel()
    label.text = "Sets"
    label.textColor = .specialGray
    label.font = .robotoBold20()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

   var setsCountLabel: UILabel = {
    let label = UILabel()
//    label.text = "1/4"
    label.textColor = .specialGray
    label.font = .robotoMedium24()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let setsLineView: UIView = {
    let view = UIView()
    view.backgroundColor = .specialLightBrown
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let repsLabel: UILabel = {
    let label = UILabel()
    label.text = "Reps"
    label.textColor = .specialGray
    label.font = .robotoBold20()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

   var repsCount: UILabel = {
    let label = UILabel()
//    label.text = "20"
    label.textColor = .specialGray
    label.font = .robotoMedium24()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let repsLinewView: UIView = {
    let view = UIView()
    view.backgroundColor = .specialLightBrown
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let editingButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "editing")?.withRenderingMode(.alwaysOriginal) ,for: .normal)
    button.backgroundColor = .clear
    button.setTitle("Editing", for: .normal)
    button.titleLabel?.font = .robotoMedium18()
    button.tintColor = .specialLightBrown
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
    return button
  }()

  private let nextSetButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .specialYellow
    button.setTitle("NEXT SET", for: .normal)
    button.titleLabel?.font = .robotoBold16()
    button.tintColor = .specialGray
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(nextSetButtonTapped), for: .touchUpInside)
    return button
  }()

    var setsNStackView = UIStackView()
    var repsNStackView = UIStackView()

  weak var cellNextSetDelegate: NextSetProtocol?

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    setConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc private func editingButtonTapped() {
    print("Editing Button Tapped")
  }

  @objc private func nextSetButtonTapped() {
//    print("Next Set Button Tapped")
    cellNextSetDelegate?.nextSetTapped()
  }

  private func setupView() {
    backgroundColor = .specialBrown
    layer.cornerRadius = 10
    translatesAutoresizingMaskIntoConstraints = false

    addSubview(nameWorkout)
    addSubview(setsLineView)
    addSubview(repsLinewView)

    setsNStackView = UIStackView(arrangedSubviews: [setsLabel, setsCountLabel], axis: .horizontal, spacing: 10)
    addSubview(setsNStackView)

    repsNStackView = UIStackView(arrangedSubviews: [repsLabel, repsCount], axis: .horizontal, spacing: 10)
    addSubview(repsNStackView)
    addSubview(editingButton)
    addSubview(nextSetButton)
  }

  private func setConstraints() {

    NSLayoutConstraint.activate([
      nameWorkout.topAnchor.constraint(equalTo: topAnchor, constant: 14),
      nameWorkout.centerXAnchor.constraint(equalTo: centerXAnchor),
      nameWorkout.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      nameWorkout.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
    ])
    NSLayoutConstraint.activate([
      setsNStackView.topAnchor.constraint(equalTo: nameWorkout.bottomAnchor, constant: 20),
      setsNStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      setsNStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      setsNStackView.heightAnchor.constraint(equalToConstant: 25)
    ])
    NSLayoutConstraint.activate([
      setsLineView.topAnchor.constraint(equalTo: setsNStackView.bottomAnchor, constant: 2),
      setsLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      setsLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      setsLineView.heightAnchor.constraint(equalToConstant: 1)
    ])
    NSLayoutConstraint.activate([
      repsNStackView.topAnchor.constraint(equalTo: setsLineView.bottomAnchor, constant: 29),
      repsNStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      repsNStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      repsNStackView.heightAnchor.constraint(equalToConstant: 25)
    ])
    NSLayoutConstraint.activate([
      repsLinewView.topAnchor.constraint(equalTo: repsNStackView.bottomAnchor, constant: 2),
      repsLinewView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      repsLinewView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      repsLinewView.heightAnchor.constraint(equalToConstant: 1)
    ])
    NSLayoutConstraint.activate([
      editingButton.topAnchor.constraint(equalTo: repsLinewView.bottomAnchor, constant: 15),
      editingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
      editingButton.heightAnchor.constraint(equalToConstant: 20),
      editingButton.widthAnchor.constraint(equalToConstant: 80)
    ])
    NSLayoutConstraint.activate([
      nextSetButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 12),
      nextSetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      nextSetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
      nextSetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
      nextSetButton.heightAnchor.constraint(equalToConstant: 43)
    ])
  }

}
