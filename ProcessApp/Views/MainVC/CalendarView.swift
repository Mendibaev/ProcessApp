//
//  CalendarView.swift
//  ProcessApp
//
//  Created by developer on 19.01.2022.
//

import UIKit

class CalendarView: UIView {

  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionVIew.translatesAutoresizingMaskIntoConstraints = false
    collectionVIew.backgroundColor = .none
    return collectionVIew
  }()

  private let idCalendarCell = "idCalendarCell"

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupViews()
    setConstraints()
    setDelegates()

    collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    backgroundColor = .specialGreen
    layer.cornerRadius = 10
    translatesAutoresizingMaskIntoConstraints = false

    addSubview(collectionView)

  }

  private func setDelegates() {
    collectionView.delegate = self
    collectionView.dataSource = self
  }

}

//MARK: - UICollectionViewDataSource

extension CalendarView: UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    7
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as! CalendarCollectionViewCell
    return cell
  }
}

//MARK: - UICollectionViewDelegate

extension CalendarView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("CollectionView Tap")
  }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension CalendarView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: 34,
           height: collectionView.frame.height)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    3
  }
}

//MARK: - SetConstraints

extension CalendarView {
private func setConstraints(){
  NSLayoutConstraint.activate([
    collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
    collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
    collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
    collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
  ])
}
}
