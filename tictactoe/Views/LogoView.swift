//
//  LogoView.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "gamecontroller.fill")
                .imageScale(.large)
                .foregroundStyle(Color.main)
                .font(.largeTitle)
            
            Text("Tic Tac Toe".uppercased())
                .font(.title2)
                .bold()
                .foregroundStyle(Color.dark)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background {
                    Capsule()
                        .foregroundStyle(Color.accentColor)
                }
        }
        .aspectRatio(1, contentMode: .fill)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LogoView()
}
