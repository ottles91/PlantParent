//
//  PlantRepository.swift
//  PlantParent
//
//  Created by Cameron Ottley on 2/9/26.
//

import Foundation

@MainActor
final class PlantRepository {
    private let apiService = PlantAPIService()
    private let cache = PlantCache()

    private(set) var cachedPlants: [Plant] = []

    init() {
        self.cachedPlants = cache.load()
    }

    func search(query: String) async throws -> [Plant] {
        try await apiService.searchPlants(query: query)
    }

    func addPlant(_ plant: Plant) throws {
        guard !cachedPlants.contains(plant) else { return }
        cachedPlants.append(plant)
        try cache.save(cachedPlants)
    }
}
