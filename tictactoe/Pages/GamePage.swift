//
//  GamePage.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import SwiftUI

struct GamePage: View {
    
    @Environment(\.dismiss) private var dimiss
    @StateObject private var vm: GameVM
    
    init(_ gameplay: Gameplay) {
        self._vm = StateObject(wrappedValue: GameVM(gameplay))
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            
            VersusView(
                gameplay: vm.gameplay,
                status: $vm.status,
                player: $vm.currentPlayer
            )
            
            StatusView(
                status: $vm.status,
                player: $vm.currentPlayer
            )
            
            BoardView(board: $vm.board,
                      status: $vm.status,
                      onTap: vm.onPlayerMove(_:)
            )
            
            Button {
                vm.reset()
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
                        Text(vm.gameplay.navigationTitle)
                            .bold()
                    }
                }
                .foregroundStyle(Color.main)
            }
        }
        .navigationBarBackButtonHidden()
        .safeAreaPadding()
        .background(Color.background)
    }

}

#Preview {
    NavigationView {
        GamePage(.multiplayer)
    }
}
