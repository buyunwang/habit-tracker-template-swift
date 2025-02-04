//
//  HabitService.swift
//  habit tracker template
//
//  Created by Buyun Wang on 2025-01-13.
//

import Foundation
import SwiftUI
import Combine

class HabitService {
    @AppStorage("GLOBAL_STREAK_KEY") var globalStreak: Int = 0
    @AppStorage("HABITS_KEY") var savedHabits: Data = Data()
    private var habits: [Habit] = []
    
    let habitServiceChanged = PassthroughSubject<Void, Never>()
    
    static let shared = HabitService()
    
    init () {
        habits = retrieveHabits()
    }
}

extension HabitService {
    func saveHabits(){
        guard let habitsJSON = try? JSONEncoder().encode(habits) else { return }
        self.savedHabits = habitsJSON
        habitServiceChanged.send()
    }
    
    func retrieveHabits() -> [Habit] {
        guard let decodeHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) else { return [] }
        
        return decodeHabits
    }
}

extension HabitService {
    func addHabit(_ habit: Habit) {
        habits.append(habit)
        saveHabits()
    }
    
    func deleteHabit(_ habit: Habit) {
        habits.removeAll(where: { $0.id == habit.id })
        updateGlobalStreak()
        saveHabits()
    }
    
    func updateHabit(forHabit habit: Habit) {
        guard let index = habits.firstIndex(where: { $0.id == habit.id }) else { return }
        
        habits[index] = habit
        saveHabits()
    }
    
    //TODO: Incread Global Streak
    func increaseGlobalStreak() {
        globalStreak += 1
    }
    
    //TODO: Reset Global Streak
    func resetGlobalStreak() {
        globalStreak = 0
    }
    
    func updateGlobalStreak() {
        if (habits.count == 0) {
            resetGlobalStreak()
        }
    }
}
