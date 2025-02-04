//
//  ContentView.swift
//  habit tracker template
//
//  Created by Buyun Wang on 2025-01-09.
//

import SwiftUI
import SwiftData

struct WelcomeView: View {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeidht = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    Circle()
                        .fill(.cyan)
                        .frame(width: screenWidth / 1.2)
                        .offset(x: -screenWidth/2, y: -screenHeidht/2)
                    
                    Path { path in
                            path.move(to: CGPoint(x: 150, y: 150))
                            
                            path.addCurve(
                                to: CGPoint(x: 250, y: 100),
                                control1: CGPoint(x: 200, y: 200),
                                control2: CGPoint(x: 250, y: 150)
                            )
                            path.addCurve(
                                to: CGPoint(x: 200, y: 50),
                                control1: CGPoint(x: 250, y: 50),
                                control2: CGPoint(x: 220, y: 30)
                            )
                            path.addCurve(
                                to: CGPoint(x: 150, y: 150),
                                control1: CGPoint(x: 170, y: 80),
                                control2: CGPoint(x: 130, y: 100)
                            )
                        }
                        .scale(3.0)
                        .foregroundStyle(.green)
                        .offset(x: screenWidth/3, y: screenHeidht/0.75)
                    
                    Circle()
                        .foregroundStyle(.yellow)
                        .frame(width: screenWidth/1.8)
                        .offset(x: screenWidth/2.5, y: -screenHeidht/4)
                }
                
                // Content
                VStack (alignment: .leading, spacing: 15) {
                    Text("Habit Tracker").font(.largeTitle).fontWeight(.heavy)
                    Text("Welcome to Habit Tracker!").font(.title2).fontWeight(.semibold)
                    NavigationLink(destination: HabitListView().navigationBarBackButtonHidden()) {
                        Text("Get Started")
                            .foregroundStyle(.white)
                            .padding()
                            .fontWeight(.bold)
                            .background(.orange)
                            .clipShape(Capsule())
                        
                    }
                }
            }
        }
    }


}

#Preview {
    WelcomeView()
        .modelContainer(for: Item.self, inMemory: true)
}
