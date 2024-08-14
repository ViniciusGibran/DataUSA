//
//  StateData.swift
//  DataUSA
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import Foundation

// MARK: - StateDataResponse
struct StateDataResponse: Codable {
    let data: [StateData]
    let source: [Source]
}

// MARK: - StateData
struct StateData: Codable {
    let idState: String
    let state: String
    let idYear: Int
    let year: String
    let population: Int
    let slugState: String

    enum CodingKeys: String, CodingKey {
        case idState = "ID State"
        case state = "State"
        case idYear = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugState = "Slug State"
    }
}
