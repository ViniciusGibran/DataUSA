//
//  DataUSARepository.swift
//  DataUSA
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import Foundation

protocol DataUSARepositoryProtocol {
    func fetchNationData() async throws -> [NationData]
    func fetchStateData() async throws -> [StateData]
}

class DataUSARepository: DataUSARepositoryProtocol {
    
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol = APIService.shared) {
        self.apiService = apiService
    }

    func fetchNationData() async throws -> [NationData] {
        let url = URL(string: "https://datausa.io/api/data?drilldowns=Nation&measures=Population")!
        let response: DataUSAResponse = try await apiService.performRequest(with: url)
        return response.data
    }
    
    func fetchStateData() async throws -> [StateData] {
        let url = URL(string: "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest")!
        let response: StateDataResponse = try await apiService.performRequest(with: url)
        return response.data
    }
}
