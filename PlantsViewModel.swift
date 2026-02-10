//
//  PlantsViewModel.swift
//  projeto_final
//
//  Created by Turma02-19 on 14/11/25.
//

import Foundation

@MainActor
class PlantsViewModel: ObservableObject {
    @Published var plants: [PlantData] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadPlants() async {
        isLoading = true
        do {
            plants = try await PlantService.shared.fetchPlants()
        } catch {
            errorMessage = "Erro: \(error.localizedDescription)"
        }
        isLoading = false
    }

    func addPlant(deviceID: String, plantID: String, luxID: String) async {
        // monta uma leitura inicial "genérica"
        let initialReading = PlantReading(
            ts: ISO8601DateFormatter().string(from: Date()),
            umidade: 0,
            luminosidade: 0,
            temperatura: 0
        )

        let newPlant = PlantDataenvio(
            type: "device_plant",
            device_id: deviceID,
            plant_id: plantID,
            luxid: luxID,
            igm: ""
        )

        do {
            try await PlantService.shared.addPlant(newPlant)
        } catch {
            errorMessage = "Erro ao adicionar planta: \(error.localizedDescription)"
        }
    }
}
