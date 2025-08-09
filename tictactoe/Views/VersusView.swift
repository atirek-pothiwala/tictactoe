//
//  VersusView.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import SwiftUI

struct VersusView: View {
    let gameplay: Gameplay
    @Binding var status: GameStatus
    @Binding var player: Player
    
    var body: some View {
        HStack(alignment: .center) {
            Text(Player.X.shortName)
                .foregroundStyle(Color.snow)
                .padding(.all, 15)
                .background {
                    Circle()
                        .foregroundStyle(selected(.X))
                }
            
            Text("V/S")
                .foregroundStyle(Color.main)
                .frame(maxWidth: .infinity)
            
            
            if gameplay == .solo {
                Text(Player.O(.computer).shortName)
                    .foregroundStyle(Color.snow)
                    .padding(.all, 15)
                    .background {
                        Circle()
                            .foregroundStyle(selected(.O(.computer)))
                    }
            } else {
                Text(Player.O(.human).shortName)
                    .foregroundStyle(Color.snow)
                    .padding(.all, 15)
                    .background {
                        Circle()
                            .foregroundStyle(selected(.O(.human)))
                    }
            }
        }
        .padding(.horizontal, 15)
        .frame(maxWidth: .infinity)
        .font(.largeTitle)
        .bold()
    }
    
    func selected(_ player: Player) -> Color {
        if status == .draw {
            return Color.gray
        }
        return self.player == player ? player.color : Color.gray
    }
}

#Preview {
    VersusView(
        gameplay: .solo,
        status: .constant(.draw),
        player: .constant(.X)
    )
}
