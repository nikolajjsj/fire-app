//
//  AppView.swift
//  fire
//
//  Created by Nikolaj Johannes Skole Jensen on 09/01/2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "Home"
    case details = "Details"
    case settings = "Settings"
}

struct AppView: View {
    @State private var tab = Tab.home
    
    var body: some View {
        TabView(selection: $tab) {
            NavigationStack {
                HomeView()
            }
            .tabItem {Label("Overview", systemImage: "chart.pie")}
            .tag(Tab.home)
            
            NavigationStack {
                DetailsView()
            }
            .tabItem {Label("Details", systemImage: "pencil.and.scribble")}
            .tag(Tab.home)
            
            NavigationStack {
                SettingsView()
            }
            .tabItem {Label("Settings", systemImage: "gear")}
            .tag(Tab.settings)
        }
    }
}

#Preview {
    AppView()
}
