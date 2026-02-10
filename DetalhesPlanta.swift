import SwiftUI


//Variaveis do ARDUINO
struct DetalhesPlanta: View {
    
    @StateObject private var themeManager = ThemeManager()
    
    @State private var temperatura: Double = 500
    @State private var luz: Double = 8000
    @State private var umidade: Double = 101
    
    @Binding var planta: PlantData
    
    var body: some View {
        ScrollView {
            Rectangle()
                .foregroundColor(.white)
                .opacity(0.2)
                .frame(width: 100, height: 10)
                .cornerRadius(10)
                .padding()
            VStack(spacing: 30) {
                
                //TEMPERATURA
                SensorRowView(
                    titulo: "Temperatura",
                    valor: planta.ultima_leitura.temperatura,
                    unidade: "°C",
                    descricao: descricaoTemperatura(planta.ultima_leitura.temperatura),
                    corDeFundo: corTemperatura(planta.ultima_leitura.temperatura),
                    icone: "thermometer.sun.fill",
                    alinhamentoTextoEsquerda: true
                )
                
                //LUMINOSIDADE
                SensorRowView(
                    titulo: "Incidência Luminosas",
                    valor: planta.ultima_leitura.luminosidade,
                    unidade: "%",
                    descricao: descricaoLuz(planta.ultima_leitura.luminosidade),
                    corDeFundo: corLuz(planta.ultima_leitura.luminosidade),
                    icone: "sun.max.fill",
                    alinhamentoTextoEsquerda: false
                )
                
                //UMIDADE
                SensorRowView(
                    titulo: "Umidade",
                    valor: planta.ultima_leitura.umidade,
                    unidade: "%",
                    descricao: descricaoUmidade(planta.ultima_leitura.umidade),
                    corDeFundo: corUmidade(planta.ultima_leitura.umidade),
                    icone: "humidity.fill",
                    alinhamentoTextoEsquerda: true
                )
            }
            .padding(.vertical, 30)
        }
        .background(Color(.fundo).ignoresSafeArea())
//        .presentationDetents([.medium, .large])
    }
    
    //MARK: - Cores Dinâmicas
    func corTemperatura(_ valor: Double) -> Color {
        switch valor {
        case ..<15: return .blue.opacity(0.4)
        case 15..<28: return .green.opacity(0.4)
        default: return .red.opacity(0.4)
        }
    }
    
    func corLuz(_ valor: Double) -> Color {
        switch valor {
        case ..<200: return .red.opacity(0.4)
        case 200..<800: return .green.opacity(0.4)
        default: return .yellow.opacity(0.4)
        }
    }
    
    func corUmidade(_ valor: Double) -> Color {
        switch valor {
        case ..<40: return .red.opacity(0.4)
        case 40..<70: return .green.opacity(0.4)
        default: return .yellow.opacity(0.4)
        }
    }
    
    //Descrições Dinâmicas
    func descricaoTemperatura(_ valor: Double) -> String {
        let valorf: String = String(format: "%.1f", valor)
        switch valor {
        case ..<15:
            return "A temperatura está muito baixa (\(valorf)°C). Aqueça o ambiente para não prejudicar o crescimento da planta."
        case 15..<28:
            return "Temperatura ideal (\(valorf)°C). As condições estão perfeitas para o desenvolvimento saudável."
        default:
            return "A temperatura está alta (\(valorf)°C). Considere resfriar o local para evitar estresse térmico."
        }
    }
    
    func descricaoLuz(_ valor: Double) -> String {
        let valorf: String = String(format: "%.1f", valor)
        switch valor {
        case ..<20:
            return "Pouca luz (\(valorf) %). A planta precisa de mais exposição para realizar fotossíntese."
        case 20..<70:
            return "Nível de luz ideal (\(valorf)) %). A iluminação está adequada para o crescimento."
        default:
            return "Excesso de luz (\(valorf)) %). Considere mover a planta para um local com sombra parcial."
        }
    }
    
    func descricaoUmidade(_ valor: Double) -> String {
        let valorf: String = String(format: "%.1f", valor)
        switch valor {
        case ..<40:
            return "Solo seco (\(valorf)%). Regue a planta para manter o solo úmido e saudável."
        case 40..<70:
            return "Umidade ideal (\(valorf)%). O solo está em boas condições de hidratação."
        default:
            return "Umidade excessiva (\(valorf)%). Evite regar mais para prevenir fungos e apodrecimento."
        }
    }
}

//Estrutura Variaves de Mudança na Sheet View
struct SensorRowView: View {
    let titulo: String
    let valor: Double
    let unidade: String
    let descricao: String
    let corDeFundo: Color
    let icone: String
    let alinhamentoTextoEsquerda: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(titulo)
                .font(.title3.bold())
                .foregroundColor(.yellow)
                .padding(.horizontal)
            
            HStack(spacing: 20) {
                if alinhamentoTextoEsquerda {
                    descricaoTexto
                    blocoValor
                } else {
                    blocoValor
                    descricaoTexto
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.9))
            )
            .shadow(radius: 3)
            .frame(maxWidth: .infinity)
            .frame(height: 180)
            .padding(.horizontal)
        }
    }
    
    var descricaoTexto: some View {
        Text(descricao)
            .font(.body)
            .foregroundColor(.black)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var blocoValor: some View {
        VStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(corDeFundo)
                    
                
                VStack(spacing: 6) {
                    Text("\(Int(valor)) \(unidade)")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                    
                    Image(systemName: icone)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.black.opacity(0.8))
                }
            }
        }
    }
}

#Preview {
    DetalhesPlanta(planta: .constant(PlantData(type:"",device_id: "", plant_id: "", luxid: "",igm:"", ultima_leitura: PlantReading(ts: "", umidade: 0, luminosidade: 0, temperatura: 0))))
}
