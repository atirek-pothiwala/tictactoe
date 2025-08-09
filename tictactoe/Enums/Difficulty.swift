//
//  Difficulty.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import SwiftUICore


enum Difficulty: String, CaseIterable, Identifiable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var id: String { self.rawValue }
    
    var color: Color {
        switch self {
        case .easy:
            return .green
        case .medium:
            return .blue
        case .hard:
            return .red
        }
    }
}
