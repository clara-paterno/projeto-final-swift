//
//  ThemeManager.swift
//  projeto_final
//
//  Created by Turma02-19 on 12/11/25.
//

import Foundation
import SwiftUI

class ThemeManager: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
}
