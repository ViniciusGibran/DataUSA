//
//  MockDataUSARepository.swift
//  DataUSATests
//
//  Created by Vinicius Gibran on 14/08/2024.
//

@testable import DataUSA

class MockDataUSARepository: DataUSARepositoryProtocol {
    var mockNationData: [NationData] = []
    var mockStateData: [StateData] = []
    
    func fetchNationData() async throws -> [NationData] {
        return mockNationData
    }
    
    func fetchStateData() async throws -> [StateData] {
        return mockStateData
    }
}
