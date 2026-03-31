//
//  SettingsView.swift
//  TodoTue2
//
//  Created by Shuvam Shrestha on 31/3/2026.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("Dark Mode")
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
