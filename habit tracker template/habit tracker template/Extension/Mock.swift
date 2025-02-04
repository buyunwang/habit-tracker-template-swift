//
//  DeveloperPreview.swift
//  habit tracker template
//
//  Created by Buyun Wang on 2025-01-13.
//

import Foundation

class Mock {
    static var habits: [Habit] = [
        .init(
            id: NSUUID().uuidString,
            emoji: "🧘‍♀️",
            title: "Meditation",
            description: "Focus on your breath",
            streak: 0
        ),
        .init(
            id: NSUUID().uuidString,
            emoji: "💪",
            title: "Workout",
            description: "Go to the gym",
            streak: 2
        ),
        .init(
            id: NSUUID().uuidString,
            emoji: "🍻",
            title: "Social",
            description: "Hang out with friends",
            streak: 1
        ),
    ]
}
