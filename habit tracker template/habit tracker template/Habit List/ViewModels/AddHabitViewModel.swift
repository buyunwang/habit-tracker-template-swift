//
//  AddHabitViewModel.swift
//  habit tracker template
//
//  Created by Buyun Wang on 2025-01-13.
//

import Foundation

class AddHabitViewModel: ObservableObject {
    @Published var emoji: String = ""
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var errorMessage: String = ""
    
    func addNewHabit() -> Bool {
        if (validateNewHabit()) {
            errorMessage = ""
            HabitService.shared.addHabit(
                Habit(
                    id: UUID().uuidString,
                    emoji: emoji,
                    title: title,
                    description: description,
                    streak: 0
                )
            )
            eraseTextFields()
        } else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        return true
    }
    
    func validateNewHabit() -> Bool {
        return (emoji.count > 0 && title.count > 1 && description.count > 1)
    }
    
    func eraseTextFields() {
        emoji = ""
        title = ""
        description = ""
    }
}
