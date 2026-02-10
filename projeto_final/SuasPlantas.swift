//
//  SuasPlantas.swift
//  projeto_final
//
//  Created by Turma02-19 on 10/11/25.
//

import SwiftUI

struct SuasPlantas: View {

    @StateObject private var vm = PlantsViewModel()
    @State private var showingSheet = false
    @State private var selectedPlant: PlantData = PlantData(type: "", device_id: "", plant_id: "", luxid: "", igm:"", ultima_leitura: PlantReading(ts: "", umidade: 0, luminosidade: 0, temperatura: 0))  // planta selecionada

    var body: some View {
        ZStack {
            Color.fundo.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {

                    Text("Suas plantas")
                        .font(Font.custom("MomoTrustDisplay-Regular", size: 40).bold())
                        .foregroundColor(Color.tab)


                    // LOADING
                    if vm.isLoading {
                        ProgressView("Carregando plantas...")
                            .padding(.top, 50)
                    }

                    // LISTA DE PLANTAS
                    ForEach(vm.plants) { plant in
                        VStack {
                            HStack {
                                AsyncImage(url: URL(string: plant.igm ?? "")) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    Image(systemName: "leaf.fill").foregroundColor(.black)
                                }
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 12))

                                VStack(alignment: .leading, spacing: 5) {
                                    Text(plant.plant_id.capitalized)
                                        .font(Font.custom("MomoTrustDisplay-Regular", size: 22))
                                        .foregroundColor(.black)

                                    Text("Temp: \(plant.ultima_leitura.temperatura, specifier: "%.1f")°C")
                                        .foregroundColor(.black)

                                    Text("Umidade: \(plant.ultima_leitura.umidade, specifier: "%.1f")%")
                                        .foregroundColor(.black)

                                    Text("Luz: \(plant.ultima_leitura.luminosidade)")
                                        .foregroundColor(.black)
                                }

                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .frame(width: 350, height: 110)
                        .background(Color("tabColor"))
                        .cornerRadius(20)
                        .onTapGesture {
                            selectedPlant = plant
                            showingSheet = true
                        }
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $showingSheet) {
                DetalhesPlanta(planta: $selectedPlant)
                    .presentationDetents([.height(740)])
        }
        .task {
            await vm.loadPlants()
        }
    }
}

#Preview {
    SuasPlantas()
}
