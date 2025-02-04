//
//  HabitButtonView.swift
//  habit tracker template
//
//  Created by Buyun Wang on 2025-01-13.
//

import SwiftUI

struct HabitButtonView: View {
    @ObservedObject var viewModel: HabitButtonViewModel
    @Binding var isEditMode: Bool
    
    init(habit: Habit, isEditMode: Binding<Bool>){
        viewModel = HabitButtonViewModel(habit: habit)
        self._isEditMode = isEditMode
    }
    
    var body: some View {
        if (!viewModel.isDeleted) {
            Button(
                action: {
                    viewModel.buttonHabitClicked()
                },
                label: {
                    HStack (alignment: .center, spacing: 15) {
                        Text(viewModel.habit.emoji)
                            .font(Font.system(size: 60))
                            .padding(.leading)
                        
                        VStack (alignment: .leading){
                            Text(viewModel.habit.title)
                                .foregroundStyle(.orange)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                            Text(viewModel.habit.description)
                                .foregroundStyle(Color(.label))
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                            Text("\(viewModel.habit.streak) \(viewModel.habit.streak == 1 ? "day" : "days") streak")
                                .foregroundStyle(Color(.label))
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        if (viewModel.isLastDateSameAsToday() && !isEditMode) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(Font.system(size: 50))
                                .foregroundStyle(.orange)
                                .padding(.trailing)
                        }
                        if (isEditMode && !viewModel.isDeleted) {
                            Button(
                                action: {viewModel.deleteHabit()},
                                label: {
                                    Image(systemName: "minus.circle.fill")
                                        .font(Font.system(size: 50))
                                        .foregroundStyle(.red)
                                        .padding(.trailing)
                                }
                            )
                        }
                        
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(15)
                    .shadow(color: Color(.systemGray), radius: 3)
                }
            )
            .disabled(viewModel.isLastDateSameAsToday() && !isEditMode)
        }
    }
}

#Preview {
    HabitButtonView(habit: Mock.habits[2], isEditMode: .constant(true))
}
