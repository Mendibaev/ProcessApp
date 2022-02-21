////
////  WeatherView.swift
////  ProcessApp
////
////  Created by developer on 20.01.2022.

import UIKit

class WeatherView: UIView {

  private let weatherView: UIView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "sun")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  private let weatherLabel: UILabel = {
    let label = UILabel()
    label.text = "Солнечно"
    label.textColor = .specialGray
    label.font = .robotoMedium18()
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let weatherRecomendation: UILabel = {
    let label = UILabel()
    label.text = "Хорошая погода, чтобы позаниматься на улице"
    label.textColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
    label.font = .robotoMedium14()
    label.adjustsFontSizeToFitWidth = true
    label.numberOfLines = 2
    label.minimumScaleFactor = 0.5
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupViews()
    setConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
    layer.cornerRadius = 10
    addShadowOnView()
    translatesAutoresizingMaskIntoConstraints = false

    addSubview(weatherView)
        addSubview(weatherLabel)
        addSubview(weatherRecomendation)
  }

  private func setConstraints() {
    NSLayoutConstraint.activate([
      weatherView.centerYAnchor.constraint(equalTo: centerYAnchor),
      weatherView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      weatherView.heightAnchor.constraint(equalToConstant: 60),
      weatherView.widthAnchor.constraint(equalToConstant: 60)
    ])
        NSLayoutConstraint.activate([
          weatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
          weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
          weatherLabel.trailingAnchor.constraint(equalTo: weatherView.leadingAnchor, constant: 10),
          weatherLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
          weatherRecomendation.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 0),
          weatherRecomendation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
          weatherRecomendation.trailingAnchor.constraint(equalTo: weatherView.leadingAnchor, constant: -10),
          weatherRecomendation.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
  }
}
