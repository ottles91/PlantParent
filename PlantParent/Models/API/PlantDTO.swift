//
//  PlantDTO.swift
//  PlantParent
//
//  Created by Cameron Ottley on 2/9/26.
//

import Foundation

struct PlantDTO: Decodable {
    let id: Int
    let commonName: String?
    let scientificName: [String]?
    let watering: String?
    let sunlight: [String]?
    let indoor: Bool?
    let defaultImage: PlantImageDTO?

    enum CodingKeys: String, CodingKey {
        case id
        case commonName = "common_name"
        case scientificName = "scientific_name"
        case watering
        case sunlight
        case indoor
        case defaultImage = "default_image"
    }
}
