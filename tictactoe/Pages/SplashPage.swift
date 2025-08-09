//
//  SplashPage.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import SwiftUI

struct SplashPage: View {
    @EnvironmentObject var navigator: Navigator
    
    var body: some View {
        VStack(spacing: 20) {
            LogoView()
            
            Text("Select Game Mode")
                .font(.title3)
            
            HStack(alignment: .center, spacing: 15) {
                ButtonView(Gameplay.solo.buttonTitle) {
                    navigator.push(.game(gameplay: .solo))
                }
                
                ButtonView(Gameplay.multiplayer.buttonTitle) {
                    navigator.push(.game(gameplay: .multiplayer))
                }
            }
            
        }
        .safeAreaPadding()
        .background(Color.background)
    }
}

#Preview {
    SplashPage()
}
