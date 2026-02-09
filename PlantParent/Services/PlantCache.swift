//
//  PlantCache.swift
//  PlantParent
//
//  Created by Cameron Ottley on 2/9/26.
//

import Foundation

final class PlantCache {
    private let cacheURL: URL

    init() {
        self.cacheURL = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("plants.json")
    }

    func save(_ plants: [Plant]) throws {
        let data = try JSONEncoder().encode(plants)
        try data.write(to: cacheURL, options: .atomic)
    }

    func load() -> [Plant] {
        guard
            let data = try? Data(contentsOf: cacheURL),
            let plants = try? JSONDecoder().decode([Plant].self, from: data)
        else {
            return []
        }
        return plants
    }
}
