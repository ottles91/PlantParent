//
//  Plant.swift
//  PlantParent
//
//  Created by Cameron Ottley on 2/9/26.
//

import Foundation

struct Plant: Identifiable, Hashable, Codable {
    let id: Int
    let commonName: String
    let scientificName: String
    let watering: String
    let sunlight: String
    let indoor: Bool
    let imageURL: URL?
}

extension Plant {
    init(dto: PlantDTO) {
        self.id = dto.id
        self.commonName = dto.commonName ?? "Unknown"
        self.scientificName = dto.scientificName?.first ?? "Unknown"
        self.watering = dto.watering ?? "Unknown"
        self.sunlight = dto.sunlight?.joined(separator: ", ") ?? "Unknown"
        self.indoor = dto.indoor ?? false
        self.imageURL = URL(string: dto.defaultImage?.thumbnail ?? "")
    }
}
