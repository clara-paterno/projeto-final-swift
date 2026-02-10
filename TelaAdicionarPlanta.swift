import SwiftUI

enum Luminosity: String, CaseIterable, Identifiable {
    case alta
    case media
    case baixa
    case selecionar
    var id: Self { self }
}

enum Esp: String, CaseIterable, Identifiable {
    case esp32_01 = "esp32-01"
    case esp32_02 = "esp32-02"
    case esp32_03 = "esp32-03"
    case selecionar = "selecionar"

    var id: Self { self }
}


struct TelaAdicionarPlanta: View {
    
    @ObservedObject var vm: PlantsViewModel
    @Environment(\.dismiss) var dismiss
    
    // UI States
    @StateObject private var themeManager = ThemeManager()
    
    @State var backgroundColor: Color = .fundo
    @State var panelColor: Color = Color("tabColor")
    @State var name: String = ""
    @State var selectedLuminosity = Luminosity.selecionar
    @State var showingSheet: Bool = false
    @State var selectedImage: Image? = nil
    @State var selectedEsp = Esp.selecionar
    
    
    
    @State var deviceID: String = ""   // ESP32
    @State var luxID: String = ""      // sensor de luz
    
    var body: some View {
        
        ZStack {
            Color.fundo.ignoresSafeArea()
            
            VStack {
                
                Text("Adicionar planta")
                    .font(Font.custom("MomoTrustDisplay-Regular", size: 40))
                    .foregroundStyle(Color("tabColor"))
                
                //FOTOS
                
                VStack {
                    
                    if let image = selectedImage {
                        image
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
                    } else {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .foregroundColor(panelColor)
                           
                    }
                    
                }.onTapGesture {
                    showingSheet = true
                }
                .sheet(isPresented: $showingSheet){
                    SelecionarFoto(selectedImage: $selectedImage)
                        .presentationDetents([.height(410)])
                    
                }.padding()
                   
                    
                
                
                // CAMPOS
                VStack(spacing: 20) {
                    
                    // Nome da planta
                    VStack {
                        HStack {
                            Text("Nome")
                                .font(Font.custom("MomoTrustDisplay-Regular", size: 20))
                                .foregroundStyle(.black)
                                .bold()
                            Spacer()
                        }
                        .padding(.leading, 15)
                        
                        TextField("Digite aqui", text: $name)
                            .multilineTextAlignment(.center)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color("tabColor"))
                                    .padding()
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(.black, lineWidth: 1)
                                            .frame(width:350, height: 35)
                                    }
                            )
                    }
                    
                    .frame(width:360, height:80)
                    .background(Color.tab)
                    .cornerRadius(20)
                    
                    // Luminosidade e Esp pickers
                    
                    HStack{
                        VStack {
                            HStack {
                                Text("Luminosidade")
                                    .foregroundStyle(.black)
                                    .font(Font.custom("MomoTrustDisplay-Regular", size: 20))
                                
                                Spacer()
                            }
                            
                            
                            Picker("", selection: $selectedLuminosity) {
                                ForEach(Luminosity.allCases) { luminosity in
                                    Text(luminosity.rawValue)
                                }
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.black, lineWidth: 1)
                            )
                            .tint(.black)
                            .padding(.leading, 15)
                            
                        }
                        .padding(.horizontal, 15)
                        .frame(width: 180, height: 80)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color("tabColor")))
                        
                        
                        VStack {
                            HStack {
                                Text("ID do esp")
                                    .foregroundStyle(.black)
                                    .font(Font.custom("MomoTrustDisplay-Regular", size: 20))
                                
                                Spacer()
                            }
                            
                            Picker("", selection: $selectedEsp) {
                                ForEach(Esp.allCases) { Esp in
                                    Text(Esp.rawValue)
                                }
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.black, lineWidth: 1)
                            )
                            .tint(.black)
                            .padding(.leading, 15)
                            
                        }
                        .padding(.horizontal, 15)
                        .frame(width:180, height: 80)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color("tabColor")))
                    }.padding()
                    
                    
                    // MARK: -Sensor de luz
                    //                    VStack {
                    //                        HStack {
                    //                            Text("ID do Sensor de Luz")
                    //                                .font(Font.custom("MomoTrustDisplay-Regular", size: 20))
                    //                                .bold()
                    //                            Spacer()
                    //                        }
                    //                        .padding(.leading, 15)
                    //
                    //                        TextField("0", text: $luxID)
                    //                            .multilineTextAlignment(.center)
                    //                            .padding(5)
                    //                            .background(
                    //                                RoundedRectangle(cornerRadius: 20)
                    //                                    .foregroundColor(Color("tabColor"))
                    //                                    .overlay(
                    //                                        RoundedRectangle(cornerRadius: 20)
                    //                                            .stroke(.black, lineWidth: 1)
                    //                                            .frame(height: 35)
                    //                                    )
                    //                            )
                    //                    }
                    //                    .padding(.horizontal, 15)
                    
                    // MARK: - BOTÃO ADICIONAR
                    Button {
                        Task {
                            await vm.addPlant(
                                deviceID: selectedEsp.rawValue,
                                plantID: name,
                                luxID: luxID
//                                igm:selectedImage
                                
                            )
                            dismiss() // volta para a tela anterior
                        }
                    } label: {
                        Text("Adicionar")
                            .font(Font.custom("MomoTrustDisplay-Regular", size: 20))
                            .foregroundColor(.black)
                            .padding()
                            .frame(width:170, height:50)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color("tabColor"))
                            )
                    }
                    
                    
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    TelaAdicionarPlanta(vm: PlantsViewModel())
}

