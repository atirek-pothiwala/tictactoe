//
//  GameVM.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import Foundation
import SwiftUICore

class GameVM: ObservableObject {
    let gameplay: Gameplay
    
    init(_ gameplay: Gameplay) {
        self.gameplay = gameplay
    }
    
    @Published var currentPlayer: Player = .X
    @Published var board: [Player?] = Array(repeating: nil, count: 9)
    @Published var status: GameStatus = .playing
    @Published var difficulty: Difficulty = .medium
            
    private func switchPlayer() {
        let autoMarker: Player = gameplay == .multiplayer ? .O(.human) : .O(.computer)
        currentPlayer = currentPlayer == .X ? autoMarker : .X
    }
    
    private func checkWinner() -> Bool {
        return AI.checkWin(board, player: currentPlayer)
    }
        
    private func checkDraw() -> Bool {
        return AI.isBoardFull(board)
    }
    
    public func onPlayerMove(_ index: Int) {
        guard board[index] == nil && status == .playing else {
            return
        }
        board[index] = currentPlayer
        checkStatus()
        
        if gameplay == .solo {
            onComputerMove()
        }
    }
    
    private func onComputerMove() {
        if let aiIndex = AI.bestMove(for: board, in: difficulty) {
            guard board[aiIndex] == nil && status == .playing else {
                return
            }
            board[aiIndex] = currentPlayer
        }
        checkStatus()
    }
    
    private func checkStatus() {
        if checkWinner() {
            status = .won(currentPlayer)
        } else if checkDraw() {
            status = .draw
        } else {
            switchPlayer()
        }
    }
    
    public func reset() {
        status = .playing
        currentPlayer = .X
        board = Array(repeating: nil, count: 9)
    }
}
