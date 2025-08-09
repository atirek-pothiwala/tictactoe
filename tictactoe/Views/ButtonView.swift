//
//  ButtonView.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let onTap: () -> Void
    
    init(_ title: String, onTap: @escaping () -> Void) {
        self.title = title
        self.onTap = onTap
    }
    
    var body: some View {
        Button {
            self.onTap()
        } label: {
            Text(self.title)
                .font(.headline)
                .foregroundStyle(Color.accentColor)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background {
            ZStack(alignment: .center) {
                Capsule()
                    .stroke(lineWidth: 2)
                    .foregroundStyle(Color.accentColor)
                Capsule()
                    .foregroundStyle(Color.dark)
            }
        }
    }
}

#Preview {
    ButtonView("Restart") {
        
    }
}
