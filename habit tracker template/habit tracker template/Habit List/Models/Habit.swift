//
//  Habit.swift
//  habit tracker template
//
//  Created by Buyun Wang on 2025-01-13.
//

import Foundation

struct Habit: Identifiable, Encodable, Decodable, Equatable {
    let id: String
    var emoji: String
    var title: String
    var description: String
    var streak: Int
    var lastDateDone: Date?
}
