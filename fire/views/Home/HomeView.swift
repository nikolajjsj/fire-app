//
//  HomeView.swift
//  fire
//
//  Created by Nikolaj Johannes Skole Jensen on 09/01/2024.
//

import SwiftUI
import Charts
import Defaults

struct HomeView: View {
    var body: some View {
        List {
            FIREView()
            ROIView()
        }
        .navigationTitle("Overview")
    }
}

#Preview {
    HomeView()
}
