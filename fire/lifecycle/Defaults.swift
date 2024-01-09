//
//  Defaults.swift
//  fire
//
//  Created by Nikolaj Johannes Skole Jensen on 09/01/2024.
//

import Foundation
import SwiftUI
import Defaults

// TODO: Add defaults
extension Defaults.Keys {
    static let theme = Key<Theme>("theme", default: .dark)
}

enum Theme: String, CaseIterable, Defaults.Serializable {
    case system = "System"
    case light = "Light"
    case dark = "Dark"
    
    var colorScheme: ColorScheme? {
        switch self {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
