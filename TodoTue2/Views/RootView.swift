//
//  RootView.swift
//  TodoTue2
//
//  Created by Shuvam Shrestha on 31/3/2026.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            Tab("Todo", systemImage: "house.fill") {
                TodoView()
            }
            Tab("Settings", systemImage: "gearshape.fill") {
                SettingsView()
            }
        }
    }
}

#Preview {
    RootView()
}
