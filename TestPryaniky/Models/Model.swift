//
//  Model.swift
//  TestPryaniky
//
//  Created by Konstantin on 22.06.2022.
//

import Foundation

struct Model: Codable {
    var data: [ModelObject]
    let view: [String]
}

// MARK: - Datum
struct ModelObject: Codable {
    let name: String
    var data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let text: String?
    let url: String?
    var selectedID: Int?
    let variants: [Variant]?

    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }
}

// MARK: - Variant
struct Variant: Codable {
    let id: Int
    let text: String
}
