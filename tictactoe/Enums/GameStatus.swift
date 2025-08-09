//
//  GameStatus.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//


enum GameStatus: Hashable {
    case playing
    case won(Player)
    case draw
}