//
//  PlantSearchResponse.swift
//  PlantParent
//
//  Created by Cameron Ottley on 2/9/26.
//

import Foundation

struct PlantSearchResponse: Decodable {
    let data: [PlantDTO]
}
