//
//  Difficulty.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//


import SwiftUI

struct DifficultySelectorView: View {
    @State private var selectedDifficulty: Difficulty = .medium
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🎯 Select Difficulty")
                .font(.title2)
                .bold()
            
            Picker("Difficulty", selection: $selectedDifficulty) {
                ForEach(Difficulty.allCases) { difficulty in
                    Text(difficulty.rawValue)
                        .tag(difficulty)
                }
            }
            .pickerStyle(MenuPickerStyle()) // Makes it a dropdown
            
            Text("Selected: \(selectedDifficulty.rawValue)")
                .font(.headline)
                .padding(.top, 10)
            
            Button("Start Game") {
                startGame(with: selectedDifficulty)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
    }
    
    func startGame(with difficulty: Difficulty) {
        // Example: Call AI with selected difficulty
        print("Game started with \(difficulty.rawValue) mode")
    }
}

#Preview {
    DifficultySelectorView()
}
