//
//  DataUSARepository.swift
//  DataUSA
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import Foundation

class DataUSARepository {

    func fetchNationData() async throws -> [NationData] {
        let url = URL(string: "https://datausa.io/api/data?drilldowns=Nation&measures=Population")!
        let response: DataUSAResponse = try await APIService.shared.performRequest(with: url)
        return response.data
    }
    
    func fetchStateData() async throws -> [StateData] {
        let url = URL(string: "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest")!
        let response: StateDataResponse = try await APIService.shared.performRequest(with: url)
        return response.data
    }
}
