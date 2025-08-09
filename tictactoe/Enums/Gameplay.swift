//
//  Gameplay.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//


enum Gameplay: Hashable {
    case solo
    case multiplayer
    
    var buttonTitle: String {
        switch self {
        case .solo:
            return "Solo"
        case .multiplayer:
            return "Multiplayer"
        }
    }
    
    var navigationTitle: String {
        switch self {
        case .solo:
            return "Solo Game"
        case .multiplayer:
            return "Multiplayer Game"
        }
    }
}
