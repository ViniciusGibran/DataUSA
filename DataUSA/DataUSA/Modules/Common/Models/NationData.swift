//
//  NationData.swift
//  DataUSA
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import Foundation

// MARK: - DataUSAResponse
struct DataUSAResponse: Codable {
    let data: [NationData]
    let source: [Source]
}

// MARK: - NationData
struct NationData: Codable {
    let idNation: String
    let nation: String
    let idYear: Int
    let year: String
    let population: Int
    let slugNation: String

    enum CodingKeys: String, CodingKey {
        case idNation = "ID Nation"
        case nation = "Nation"
        case idYear = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugNation = "Slug Nation"
    }
}

// MARK: - Source
struct Source: Codable {
    let measures: [String]
    let annotations: Annotations
    let name: String
    let substitutions: [String]
}

// MARK: - Annotations
struct Annotations: Codable {
    let sourceName: String
    let sourceDescription: String
    let datasetName: String
    let datasetLink: String
    let tableID: String
    let topic: String
    let subtopic: String

    enum CodingKeys: String, CodingKey {
        case sourceName = "source_name"
        case sourceDescription = "source_description"
        case datasetName = "dataset_name"
        case datasetLink = "dataset_link"
        case tableID = "table_id"
        case topic
        case subtopic
    }
}
