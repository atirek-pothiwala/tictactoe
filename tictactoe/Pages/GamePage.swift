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
    @State private var showAlert: Bool = false
    
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
            
            ButtonView("Reset Game") {
                showAlert = true
            }
            .padding(.top, 25)
        }
        .alert("Game Reset?", isPresented: $showAlert, actions: {
            Button("Cancel", role: .cancel) {
                showAlert = false
            }
            Button("Reset", role: .destructive) {
                logic.reset()
            }
        })
        .tint(.white)
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
