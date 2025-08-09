//
//  Player.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import SwiftUICore

enum Player: Hashable {
    case X
    case O(PlayerType)
    
    var value: String {
        switch self {
        case .X:
            return "X"
        case .O:
            return "O"
        }
    }
    
    var shortName: String {
        switch self {
        case .X:
            return "P1"
        case .O(let type):
            if type == .human {
                return "P2"
            }
            return "AI"
        }
    }
    
    var fullName: String {
        switch self {
        case .X:
            return "Player 1"
        case .O(let type):
            if type == .human {
                return "Player 2"
            }
            return "Computer"
        }
    }
    
    var color: Color {
        switch self {
        case .X:
            return Color.red
        case .O:
            return Color.blue
        }
    }
}
