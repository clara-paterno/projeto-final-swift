import SwiftUI

struct CustomDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        return context.maxDetentValue - 1
    }
}

struct ConfigView: View {
    
    @StateObject private var themeManager = ThemeManager()
    
    @State var showComoUsar: Bool = false
    @State var showSobreNos : Bool = false
    
    var corPrincipal: Color = .fundo
    var corSecundária: Color = .tab
    var corTerciária: Color = .black
    
    var body: some View {
        ZStack {
            Color(corPrincipal).ignoresSafeArea()
            
            Spacer()
            VStack {
                if themeManager.isDarkMode {
                    Image("logoEscuro")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                } else {
                    Image("logoClaro")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                }
                
                VStack {
                    HStack {
                        Button() {
                                                    themeManager.isDarkMode.toggle()
                                                } label: {
                                                    HStack{
                                                        Text("Alterar Tema").font(Font.custom("MomoTrustDisplay-Regular", size: 15))
                                                        Spacer()
                                                        if themeManager.isDarkMode {
                                                            Image(systemName: "moon.fill")
                                                                .offset(x: -8, y: 0)
                                                        } else {
                                                            Image(systemName: "sun.max.fill")
                                                                .offset(x: -8, y: 0)
                                                        }
                                                    }
                                                }

                    }
                    .padding()
                    .frame(width: 350, height: 55)
                    .background(Color(corSecundária))
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    
                    HStack {
                                            Button() {
                                                showComoUsar.toggle()
                                            } label: {
                                                Text("Como usar o App").font(Font.custom("MomoTrustDisplay-Regular", size: 15))
                                                Spacer()
                                                Image(systemName: "questionmark")
                                                    .resizable()
                                                    .frame(width: 15)
                                                    .offset(x: -10, y: 0)
                                            } .sheet(isPresented: $showComoUsar) {
                                                ComoUsar()
                                                    .presentationDetents([.custom(CustomDetent.self)])
                                            }
                                        }

                    .padding()
                    .frame(width: 350, height: 55)
                    .background(Color(corSecundária))
                    .foregroundColor(.black)
                    .cornerRadius(20)
                    
                    HStack {
                                            Button() {
                                                showSobreNos.toggle()
                                            } label: {
                                                Text("Desenvolvedores").font(Font.custom("MomoTrustDisplay-Regular", size: 15))
                                                Spacer()
                                                Image(systemName: "person.3.fill")
                                            }.sheet(isPresented: $showSobreNos) {
                                                SobreNos().presentationDetents([
                                                    .height(400)
                                                ])
                                            }
                                        }

                    .padding()
                    .frame(width: 350, height: 55)
                    .background(Color(corSecundária))
                    .foregroundColor(.black)
                    .cornerRadius(20)
                }
                .padding()
                .frame(width: 350, height: 450)
            }
        }
        .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
    }
}


#Preview {
    ConfigView()
}
