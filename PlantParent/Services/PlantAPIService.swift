//
//  PlantAPIService.swift
//  PlantParent
//
//  Created by Cameron Ottley on 2/9/26.
//

import Foundation

final class PlantAPIService {
    private let apiKey = "YOUR_API_KEY"

    func searchPlants(query: String) async throws -> [Plant] {
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(
                string: "https://perenual.com/api/species-list?key=\(apiKey)&q=\(encodedQuery)"
              )
        else {
            return []
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(PlantSearchResponse.self, from: data)
        return decoded.data.map(Plant.init)
    }
}
