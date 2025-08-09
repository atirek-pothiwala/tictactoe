//
//  AILogic.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import Foundation

struct AILogic {
    /// Returns the best move index for AI ("O") using the Minimax algorithm
    static func bestMove(for board: [Player?], in difficulty: Difficulty) -> Int? {
        let availableMoves = board.indices.filter { board[$0] == nil }
        
        switch difficulty {
        case .easy:
            // Always random
            return availableMoves.randomElement()
        case .medium:
            // 50% chance AI plays smart, 50% random
            if Bool.random() {
                return minimaxBestMove(for: board)
            } else {
                return availableMoves.randomElement()
            }
            
        case .hard:
            // Always smart
            return minimaxBestMove(for: board)
        }
    }
    
    /// Minimax Logic
    private static func minimaxBestMove(for board: [Player?]) -> Int? {
        var bestScore = Int.min
        var move: Int? = nil
        
        for (index, cell) in board.enumerated() where cell == nil {
            var newBoard = board
            newBoard[index] = .O(.computer)
            let score = minimax(board: newBoard, depth: 0, isMaximizing: false)
            if score > bestScore {
                bestScore = score
                move = index
            }
        }
        return move
    }
    
    /// Minimax recursive algorithm
    private static func minimax(board: [Player?], depth: Int, isMaximizing: Bool) -> Int {
        if checkWin(board, player: .O(.computer)) { return 10 - depth } // AI wins
        if checkWin(board, player: .X) { return depth - 10 } // Player wins
        if isBoardFull(board) { return 0 } // Draw
        
        if isMaximizing {
            var bestScore = Int.min
            for (index, cell) in board.enumerated() where cell == nil {
                var newBoard = board
                newBoard[index] = .O(.computer)
                let score = minimax(board: newBoard, depth: depth + 1, isMaximizing: false)
                bestScore = max(score, bestScore)
            }
            return bestScore
        } else {
            var bestScore = Int.max
            for (index, cell) in board.enumerated() where cell == nil {
                var newBoard = board
                newBoard[index] = .X
                let score = minimax(board: newBoard, depth: depth + 1, isMaximizing: true)
                bestScore = min(score, bestScore)
            }
            return bestScore
        }
    }
    
    /// Checks if a given player has won
    public static func checkWin(_ board: [Player?], player: Player) -> Bool {
        let winPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
            [0, 4, 8], [2, 4, 6]              // Diagonals
        ]
        return winPatterns.contains { pattern in
            pattern.allSatisfy { board[$0] == player }
        }
    }
    
    /// Checks if the board is full
    public static func isBoardFull(_ board: [Player?]) -> Bool {
        return board.allSatisfy { $0 != nil }
    }
}
