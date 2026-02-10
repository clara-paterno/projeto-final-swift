import SwiftUI
struct pessoa: Hashable {
    var nome: String
    var cargo: String
}
struct SobreNos: View {
    
    @StateObject private var themeManager = ThemeManager()
        
    var corPrincipal: Color = .fundo
    var corSecundária: Color = .tab
    var corTerciária: Color = .black
    
    var equipe: [pessoa] = [
        pessoa(nome: "Maria Clara", cargo: "Front-end e Backend"),
        pessoa(nome: "Enzo Sá", cargo: "Front-end"),
        pessoa(nome: "Gabriel Oliveira", cargo: "Backend"),
        pessoa(nome: "Mario Bernardo", cargo: "Front-end"),
        pessoa(nome: "Sergio de Paiva", cargo: "Front-end")]
    
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
                       Spacer()
                       VStack {
                           Text("Equipe de Desenvolvimento")
                               .font(Font.custom("MomoTrustDisplay-Regular", size: 23))
                               .bold()
                               .foregroundStyle(Color(corTerciária))
                               .padding()
                               .background() {
                                   Rectangle()
                                       .foregroundColor(Color(corSecundária))
                               }
                               .cornerRadius(20)
                           VStack(alignment: .leading) {
                               ForEach(equipe, id:\.self) { pessoa in
                                   HStack(alignment: .center) {
                                       Text(pessoa.nome)
                                           .font(Font.custom("MomoTrustDisplay-Regular", size: 25))
                                           .foregroundStyle(Color(corTerciária))
                                       Text(pessoa.cargo)
                                           .foregroundStyle(corTerciária)
                                           .font(Font.custom("MomoTrustDisplay-Regular", size: 15))
                                           .padding(.top, 5)
                                   }
                               }
                           }
                           .padding()
                           .background() {
                               Rectangle()
                                   .foregroundColor(Color(corSecundária))
                                   .cornerRadius(20)
                           }
                       }
                       Spacer()
                       Spacer()
                       Spacer()
                   }
               }
        }
}
#Preview {
    SobreNos()
}
