//
//  SettingsView.swift
//  fire
//
//  Created by Nikolaj Johannes Skole Jensen on 09/01/2024.
//

import SwiftUI
import Defaults

struct SettingsView: View {
    @Default(.theme) private var theme
    
    var body: some View {
        List {
            Section("Appearance") {
                Picker("Theme", selection: $theme) {
                    ForEach(Theme.allCases, id: \.self) { t in
                        Text(t.rawValue).tag(t)
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
