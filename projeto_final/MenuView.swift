import SwiftUI

struct MenuView: View {
    
    @Binding var showMainApp: Bool
    @State var textColor: Color = Color("tabColor")
    @Environment(\.colorScheme) var colorScheme
    @State private var isPressed: Bool = false
    @StateObject private var themeManager = ThemeManager()
    
    var body: some View {
        ZStack{
            Color("fundo")
                .ignoresSafeArea()
            
            VStack(){
                
                ZStack{
                    ZStack{
                        Text("Planta")
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 80))
                            .foregroundStyle(textColor)
                            .zIndex(2)
                        
                        Text("Planta")
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 80))
                            .foregroundStyle(.black)
                            .offset(CGSize(width: 10, height: -5))
                            .zIndex(1)
                    }.zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    
                    ZStack{
                        Text("Planta")
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 80))
                            .foregroundStyle(textColor)
                            .zIndex(2)
                        
                        Text("Planta")
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 80))
                            .foregroundStyle(.black)
                            .offset(CGSize(width: 10, height: -5))
                            .zIndex(1)
                    }.offset(CGSize(width: 1, height: 70))
                        .zIndex(2)
                    
                    ZStack{
                        Text("Planta")
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 80))
                            .foregroundStyle(textColor)
                            .zIndex(2)
                        
                        Text("Planta")
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 80))
                            .foregroundStyle(.black)
                            .offset(CGSize(width: 10, height: -5))
                            .zIndex(1)
                    }
                    .offset(CGSize(width: 1, height: 140))
                    .zIndex(3)
                    
                    
                }
                
                Spacer()
                
                Button {
                    isPressed.toggle()
                    showMainApp = true
                } label: {
                    
                    if colorScheme == .dark{
                        
                        Image("logoEscuro")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                    } else if colorScheme == .light {
                        
                        Image("logoClaro")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 420, height: 420)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .scaleEffect(isPressed ? 1.85 : 1.0)
                    }
                    
                }
                Spacer()
            }.preferredColorScheme(themeManager.isDarkMode ? .dark: .light)
        }
    }
}

#Preview {
    MenuView(showMainApp: .constant(false)) // ✅ binding fixo para preview
}


