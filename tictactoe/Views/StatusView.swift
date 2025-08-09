//
//  StatusView.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import SwiftUI

struct StatusView: View {
    
    @Binding var status: GameStatus
    @Binding var player: Player
    
    var body: some View {
        if status == .playing {
            stepView
        } else if status == .draw {
            drawView
        } else {
            winnerView
        }
    }
    
    var stepView: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(player.value)
                .foregroundStyle(player.color)
                .font(.largeTitle)
            
            Text("Make a move!")
                .font(.title2)
                .bold()
                .foregroundStyle(Color.main)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .bold()
    }
    
    var winnerView: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(systemName: "crown")
                .imageScale(.large)
                .foregroundStyle(player.color)
                .font(.largeTitle)
            
            Text("\(player.fullName) Won")
                .font(.title2)
                .bold()
                .foregroundStyle(Color.main)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .bold()
    }
    
    var drawView: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: "face.smiling")
                .imageScale(.large)
                .foregroundStyle(Color.main)
                .font(.largeTitle)
            
            Text("Match Draw!")
                .font(.title)
                .foregroundStyle(Color.main)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .bold()
    }
}

#Preview {
    StatusView(
        status: .constant(.playing),
        player: .constant(.X)
    )
}
