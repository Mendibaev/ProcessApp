//
//  WorkoutModel.swift
//  ProcessApp
//
//  Created by developer on 04.03.2022.
//

import Foundation
import RealmSwift

class WorkoutModel: Object {
  @Persisted var workoutDate: Date
  @Persisted var workoutNumberOfDay: Int = 0
  @Persisted var workoutName: String = "Unknow"
  @Persisted var workoutRepeat: Bool = true
  @Persisted var workoutSets: Int = 0
  @Persisted var workoutReps: Int = 0
  @Persisted var workoutTimer: Int = 0
  @Persisted var workoutImage: Data? 
}
