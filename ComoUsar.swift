import SwiftUI
struct ComoUsar: View {
    
    @StateObject private var themeManager = ThemeManager()
    
    var corPrincipal: Color = .fundo
    var corSecundária: Color = .tab
    var corTerciária: Color = .black
    
    var body: some View {
        ZStack {
            Color(corPrincipal).ignoresSafeArea()
            VStack {
                Rectangle()
                    .foregroundColor(.white)
                    .opacity(0.2)
                    .frame(width: 100, height: 10)
                    .cornerRadius(10)
                    .padding()
                
                Text("Como Usar?")
                    .font(Font.custom("MomoTrustDisplay-Regular", size: 30)
                        .bold())
                    .foregroundStyle(.black)
                    .padding()
                    .background() {
                        Rectangle()
                            .foregroundColor(Color(corSecundária))
                    }
                    .cornerRadius(20)
                Spacer()
                
                HStack{
                    Image("fotoSuasPlantas")
                        .resizable()
                        .frame(width: 90, height: 180)
                        .cornerRadius(10)
                    VStack{
                        Text("Suas Plantas")
                            .foregroundStyle(Color(corTerciária))
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 26))
                        Spacer()
                        Text("Aqui você pode navegar pelas plantas que você cadastrou. Clique nos icones para acessar a situação da planta")
                            .foregroundStyle(Color(corTerciária))
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 15))
                            .multilineTextAlignment(.center)
                    }.frame(width: 240, height: 140)
                }
                .padding()
                .background() {
                    Rectangle()
                        .foregroundColor(Color("tabColor"))
                        .cornerRadius(20)
                }
                
                HStack{
                    VStack{
                        Text("Informações ")
                            .foregroundStyle(Color(corTerciária))
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 35))
                        Spacer()
                        Text("Nessa tela você tem acesso as ultimas leituras do dispoitivo, contendo dados de umidade do solo, incidencia luminosa e temperatura.")
                            .foregroundStyle(Color(corTerciária))
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 15))
                            .multilineTextAlignment(.center)
                    }.frame(width: 240, height: 160)
                    Image("fotoInformacoesPlanta")
                        .resizable()
                        .frame(width: 90, height: 160)
                        .cornerRadius(10)
                }
                .padding()
                .background() {
                    Rectangle()
                        .foregroundColor(Color("tabColor"))
                        .cornerRadius(20)
                }
                
                HStack{
                    Image("fotoAdicionarPlantas")
                        .resizable()
                        .frame(width: 90, height: 180)
                        .cornerRadius(10)
                    VStack{
                        Text("Adição")
                            .foregroundStyle(Color(corTerciária))
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 35))
                        Spacer()
                        Text("Cadastre suas plantas nessa tela. Selecione as preferencias de luminosidade da planta e decida um nome para exibir na lista.")
                            .foregroundStyle(Color(corTerciária))
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 15))
                            .multilineTextAlignment(.center)
                    }.frame(width: 240, height: 160)
                }
                .padding()
                .background() {
                    Rectangle()
                        .foregroundColor(Color("tabColor"))
                        .cornerRadius(20)
                }
            }
        }
    }
}
#Preview {
    ComoUsar()
}
