//
//  AddHabitView.swift
//  habit tracker template
//
//  Created by Buyun Wang on 2025-01-13.
//

import SwiftUI

struct AddHabitView: View {
    
    @StateObject var viewModel = AddHabitViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            // Emoji Picker
            TextField("🫰", text: $viewModel.emoji.max(1))
                .frame(width: 50)
                .font(.system(size: 50))
                .padding(.top, 30)
            
            // Title
            TextField("Title", text: $viewModel.title.max(20))
                .font(.title)
                .fontWeight(.bold)
            
            // Description
            TextField("Description", text: $viewModel.description.max(70), axis: .vertical)
                .font(.title2)
                .multilineTextAlignment(.leading)
            
            // Error text
            if (viewModel.errorMessage.count > 0) {
                Text(viewModel.errorMessage)
                    .foregroundStyle(.red)
            }
            
            // Add Button
            Button(
                action: {
                    if (viewModel.addNewHabit()) {
                        presentationMode.wrappedValue.dismiss()
                    }
                },
                label: {
                    Text("Add")
                        .foregroundStyle(.white)
                        .padding()
                        .fontWeight(.bold)
                        .background(.orange)
                        .clipShape(Capsule())
                }
            )
            
            Spacer()
            // Save, Erase, Dismiss sheet
        }
        .padding()
    }
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(limit))
            }
        }
        return self
    }
}

#Preview {
    AddHabitView()
}
