import SwiftUI

struct RootView: View {
    
    @State private var showMainApp = false
    
    var body: some View {
        ZStack {
            if showMainApp {
                ContentView() // Main Tabbed View
            } else {
                MenuView(showMainApp: $showMainApp)
            }
        }
        .animation(.easeInOut, value: showMainApp)
    }
}

#Preview {
    RootView()
}
