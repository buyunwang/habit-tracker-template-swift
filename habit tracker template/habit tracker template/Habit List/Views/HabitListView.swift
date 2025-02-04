//
//  HabitListView.swift
//  habit tracker template
//
//  Created by Buyun Wang on 2025-01-12.
//

import SwiftUI

struct HabitListView: View {
    
    @StateObject var viewModel = HabitListViewModel()
    @State var showAddHabitView: Bool = false
    @State var isEditMode: Bool = false
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading, spacing: 30){
                // Header
                Text("Start your habit tracking journey")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                VStack (alignment: .leading, spacing: 5) {
                    // Today's date
                    Text(viewModel.dateString)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.cyan)
                    
                    // List Streak
                    Text("\(viewModel.globalStreak) \(viewModel.globalStreak == 1 ? "day" : "days") streak")
                        .font(.title3)
                }

                // Habit List
                // Button
                LazyVStack (spacing: 15) {
                    ForEach (viewModel.habits) { habit in
                        HabitButtonView(habit: habit, isEditMode: $isEditMode)
                    }
                }
        
                // Add Habit Button
                HStack{
                    Spacer()
                    
                    Button(
                        action: {
                            showAddHabitView.toggle()
                        },
                        label: {
                            Image(systemName: "plus.circle.fill")
                                .font(Font.system(size: 50))
                                .foregroundStyle(.orange)
                        }
                    )
                }
                
                Spacer()
                
            }
            .padding()
        }
        .sheet(
            isPresented: $showAddHabitView,
            onDismiss: viewModel.onAddHabitDismissed,
            content: { AddHabitView().presentationDragIndicator(.visible)
            }
        )
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button(isEditMode ? "Done" : "Edit") {
                    isEditMode.toggle()
                    viewModel.refreshHabits()
                }
        }}
    }
}

#Preview {
    HabitListView()
}
