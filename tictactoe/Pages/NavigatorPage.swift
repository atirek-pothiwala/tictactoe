//
//  ContentView.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import SwiftUI

struct NavigatorPage: View {
    
    @StateObject private var navigator = Navigator()
    
    var body: some View {
        NavigationStack(path: $navigator.path) {
            SplashPage()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .splash:
                        SplashPage()
                    case .game(let gameplay):
                        GamePage(gameplay)
                    }
                }
        }
        .environmentObject(navigator)
    }
}

#Preview {
    NavigatorPage()
}
