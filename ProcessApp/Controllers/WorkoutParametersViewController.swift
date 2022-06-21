//
//  WorkoutParametersViewController.swift
//  ProcessApp
//
//  Created by developer on 19.05.2022.
//

import UIKit
import RealmSwift

class WorkoutParametersViewController: UIViewController {

   private let startWorkoutLabel: UILabel = {
    let label = UILabel()
    label.text = "START WORKOUT"
    label.textColor = .specialBlack
    label.font = .robotoMedium24()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let pinkView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemPink
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let closeButton: UIButton = {
    let button = UIButton()
    button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
    return button
  }()

  private let womanWorkoutImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "stortsman")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  let detailsLabel = UILabel(text: "Details")
  var workoutModel = WorkoutModel()

  private var numberOfSet = 1

  private let workoutParametersView = WorkoutParametersView()

  private let finishButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .specialGreen
    button.setTitle("FINISH", for: .normal)
    button.titleLabel?.font = .robotoBold16()
    button.tintColor = .white
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    return button
  }()

  override func viewDidLayoutSubviews() {
    closeButton.layer.cornerRadius = closeButton.frame.height / 2
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setConstraints()
    setWorkoutParameters()
    print(workoutModel)
    setDelegates()
  }

  private func setDelegates() {
    workoutParametersView.cellNextSetDelegate = self
  }

  @objc private func closeButtonTap() {
    dismiss(animated: true, completion: nil)
  }

  @objc private func finishButtonTapped() {
    print("Finish Button Tapped")
  }

  private func setWorkoutParameters() {
    workoutParametersView.nameWorkout.text = workoutModel.workoutName
    workoutParametersView.setsCountLabel.text = "\(numberOfSet)/\(workoutModel.workoutSets)"
    workoutParametersView.repsCount.text = "\(workoutModel.workoutReps)"
  }

  private func setupViews() {
    view.backgroundColor = .specialBackground
    view.addSubview(startWorkoutLabel)
    view.addSubview(closeButton)
    view.addSubview(womanWorkoutImageView)
    view.addSubview(detailsLabel)
    view.addSubview(workoutParametersView)
    view.addSubview(finishButton)
  }

    private func setConstraints() {
      NSLayoutConstraint.activate([
        startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
        startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        startWorkoutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 95),
        startWorkoutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -95)
      ])
      NSLayoutConstraint.activate([
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
        closeButton.heightAnchor.constraint(equalToConstant: 30),
        closeButton.widthAnchor.constraint(equalToConstant: 30)
      ])
      NSLayoutConstraint.activate([
      womanWorkoutImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 28),
      womanWorkoutImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      womanWorkoutImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      womanWorkoutImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
      ])
      NSLayoutConstraint.activate([
        detailsLabel.topAnchor.constraint(equalTo: womanWorkoutImageView.bottomAnchor, constant: 26),
        detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
      ])
      NSLayoutConstraint.activate([
        workoutParametersView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 5),
        workoutParametersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
        workoutParametersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
        workoutParametersView.heightAnchor.constraint(equalToConstant: 245)
      ])
      NSLayoutConstraint.activate([
        finishButton.topAnchor.constraint(equalTo: workoutParametersView.bottomAnchor, constant: 13),
        finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
        finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
        finishButton.heightAnchor.constraint(equalToConstant: 55)
      ])


    }
}

extension WorkoutParametersViewController: NextSetProtocol {
  func nextSetTapped() {
    print("Next Set Button Tapped")

    if numberOfSet < workoutModel.workoutSets {
      numberOfSet += 1
      workoutParametersView.setsCountLabel.text = "\(numberOfSet)/\(workoutModel.workoutSets)"
    } else {
      alertOk(title: "Error", message: "Finish your workout")
    }
  }


}






  

