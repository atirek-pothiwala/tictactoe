//
//  Navigator.swift
//  tictactoe
//
//  Created by Atirek Pothiwala on 09/08/25.
//


import SwiftUI

class Navigator: ObservableObject {
    @Published var path = NavigationPath()

    func reset() {
        path.removeLast(path.count)
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func push(_ view: Route) {
        path.append(view)
    }
}

extension NavigationPath {
    mutating func reset(){
        self.removeLast(self.count)
    }
}
