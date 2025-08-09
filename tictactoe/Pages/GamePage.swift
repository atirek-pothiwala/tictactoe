//
//  GamePage.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import SwiftUI

struct GamePage: View {
    
    @Environment(\.dismiss) private var dimiss
    @StateObject private var logic: GameLogic
    
    init(_ gameplay: Gameplay) {
        self._logic = StateObject(wrappedValue: GameLogic(gameplay))
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            
            VersusView(
                gameplay: logic.gameplay,
                status: $logic.status,
                player: $logic.currentPlayer
            )
            
            StatusView(
                status: $logic.status,
                player: $logic.currentPlayer
            )
            
            BoardView(board: $logic.board,
                      status: $logic.status,
                      onTap: logic.onPlayerMove(_:)
            )
            
            Button {
                logic.reset()
            } label: {
                Text("Reset Game")
                    .bold()
                    .foregroundStyle(Color.accentColor)
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background {
                ZStack(alignment: .center) {
                    Capsule()
                        .stroke(lineWidth: 2)
                        .foregroundStyle(Color.accentColor)
                    Capsule()
                        .foregroundStyle(Color.dark)
                }
            }
        
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    dimiss()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                        Text(logic.gameplay.navigationTitle)
                            .bold()
                    }
                }
                .foregroundStyle(Color.main)
            }
            
            if logic.gameplay == .solo {
                ToolbarItem(placement: .topBarTrailing) {
                    Picker("Difficulty", selection: $logic.difficulty) {
                        ForEach(Difficulty.allCases) { difficulty in
                            Text(difficulty.rawValue)
                                .tag(difficulty)
                        }
                    }
                    .tint(logic.difficulty.color)
                    .pickerStyle(MenuPickerStyle())
                }
            }
        }
        .navigationBarBackButtonHidden()
        .safeAreaPadding()
        .background(Color.background)
    }

}

#Preview {
    NavigationView {
        GamePage(.solo)
    }
}
