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
            
    private func switchPlayer() {
        let autoMarker: Player = gameplay == .multiplayer ? .O(.human) : .O(.computer)
        currentPlayer = currentPlayer == .X ? autoMarker : .X
    }
    
    private func checkWinner() -> Bool {
        // Checking rows
        for i in stride(from: 0, to: 9, by: 3) {
            if board[i] == currentPlayer && board[i+1] == currentPlayer && board[i+2] == currentPlayer {
                return true
            }
        }
        
        // Checking columns
        for i in 0..<3 {
            if board[i] == currentPlayer && board[i+3] == currentPlayer && board[i+6] == currentPlayer {
                return true
            }
        }
        
        // Checking diagonals
        if board[0] == currentPlayer && board[4] == currentPlayer && board[8] == currentPlayer {
            return true
        }
        if board[2] == currentPlayer && board[4] == currentPlayer && board[6] == currentPlayer {
            return true
        }
        
        return false
    }
    
    private func checkDraw() -> Bool {
        return board.allSatisfy { $0 != nil }
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
        let indexes = board.indices.filter({
            board[$0] == nil
        })
        if let randomIndex = indexes.randomElement() {
            guard board[randomIndex] == nil && status == .playing else {
                return
            }
            board[randomIndex] = currentPlayer
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
