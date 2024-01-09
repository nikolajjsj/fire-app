//
//  fireApp.swift
//  fire
//
//  Created by Nikolaj Johannes Skole Jensen on 09/01/2024.
//

import SwiftUI
import Defaults

@main
struct fireApp: App {
    @Default(.theme) private var theme
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .preferredColorScheme(theme.colorScheme)
        }
    }
}
