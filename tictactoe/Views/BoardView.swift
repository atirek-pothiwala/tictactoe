//
//  BoardView.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import SwiftUI

struct BoardView: View {
    
    @Binding var board: [Player?]
    @Binding var status: GameStatus
    let onTap: (Int) -> Void
        
    private let columns = Array.init(
        repeating: GridItem(.flexible(), spacing: 10),
        count: 3
    )
    
    var body: some View {
        LazyVGrid(columns: self.columns, spacing: 10) {
            ForEach(self.board.indices, id: \.self) { index in
                let player = self.board[index]
                Button {
                    self.onTap(index)
                } label: {
                    Text(player?.value ?? "")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundStyle(player?.color ?? Color.clear)
                        .font(.largeTitle)
                        .bold()
                }
                .aspectRatio(1, contentMode: .fill)
                .background {
                    Rectangle()
                        .foregroundStyle(Color.background)
                }
                .disabled(status != .playing)
            }
        }
        .background {
            Rectangle()
                .foregroundStyle(Color.main)
        }
    }
}

#Preview {
    @Previewable @StateObject var vm = GameVM(.multiplayer)
    BoardView(board: $vm.board, status: $vm.status, onTap: vm.onPlayerMove)
}
