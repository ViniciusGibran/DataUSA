//
//  DataUSARepository.swift
//  DataUSA
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import Foundation

struct DataUSAResponse: Decodable {}

class DataUSARepository {
    func fetchNationData() async throws -> [DataUSAResponse] {
        let url = URL(string: "https://datausa.io/api/data?drilldowns=Nation&measures=Population")!
        let response: DataUSAResponse = try await APIService.shared.performRequest(with: url)
        return [response] // response.rates.map { ExchangeRate(currency: $0.key, rate: $0.value) }
    }
    
    func fetchStateData() async throws -> [DataUSAResponse] {
        let url = URL(string: "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest")!
        let response: DataUSAResponse = try await APIService.shared.performRequest(with: url)
        return [response] // response.rates.map { ExchangeRate(currency: $0.key, rate: $0.value) }
    }
}
