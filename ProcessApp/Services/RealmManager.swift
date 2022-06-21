//
//  RealmManager.swift
//  ProcessApp
//
//  Created by developer on 16.05.2022.
//

import Foundation
import RealmSwift

class RealmManager {

  static let shared = RealmManager()

  private init() {}

  let localRealm = try! Realm()

  func saveWorkoutModel(model: WorkoutModel) {
    try! localRealm.write {
      localRealm.add(model)
    }
  }


}
