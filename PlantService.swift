import Foundation

class PlantService {
    static let shared = PlantService()
    private init() {}

    private let baseURL = "http://192.168.128.32:1880/leituraendpointregistrados"
    private let envioURL = "http://192.168.128.32:1880/envioendpoint"

    // GET – busca todas as plantas do usuário
    func fetchPlants() async -> [PlantData] {
        guard let url = URL(string: "http://192.168.128.32:1880/leituraendpointregistrados") else {
            return []
        }
        
        do {
            // Requisição assíncrona moderna
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decodifica JSON
            let parsed = try JSONDecoder().decode([PlantData].self, from: data)
            
            return parsed
        }
        catch {
            print("Erro ao buscar plantas:", error)
            return []
        }
    }


    // POST – adiciona uma nova planta
    func addPlant(_ plant: PlantDataenvio) async throws {
        guard let url = URL(string: envioURL) else { throw URLError(.badURL) }

        let bodyString =
                    "type=device_plant" +
        "&device_id=\(plant.device_id)" +
        "&plant_id=\(plant.plant_id)" +
        "&luxid=\(plant.luxid)" +
        "&igm=\(plant.igm)"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.httpBody =  bodyString.data(using: .utf8)

        let (_, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else { throw URLError(.badServerResponse) }
    }
//    func enviarLeitura(
//            device_id: String,
//            plant_id: String,
//            luxId: String,
//            igm: String
//            
//        ) async throws -> String {
//
//            let url = URL(string: "http://192.168.0.10:1880/envioendpoint")!  // coloque sua URL
//
//            // Monta os dados como x-www-form-urlencoded
//            let bodyString =
//            "type=device_plant" +
//            "&device_id=\(device_id)" +
//            "&plant_id=\(plant_id)" +
//            "&luxid=\(luxId)" +
//            "&igm=\(igm)"
//                
//                
//
//            let bodyData = bodyString.data(using: .utf8)!
//
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//            request.httpBody = bodyData
//
//            // Envia usando async/await
//            let (data, response) = try await URLSession.shared.data(for: request)
//
//            if let http = response as? HTTPURLResponse {
//                print("HTTP CODE:", http.statusCode)
//            }
//
//            return String(data: data, encoding: .utf8) ?? ""
//        }
}
