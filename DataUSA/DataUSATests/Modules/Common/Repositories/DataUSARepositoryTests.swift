//
//  DataUSARepositoryTests.swift
//  DataUSATests
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import XCTest
@testable import DataUSA

class DataUSARepositoryTests: XCTestCase {
    
    var repository: DataUSARepository!
    var mockAPIService: MockAPIService!
    
    override func setUp() {
        super.setUp()
        mockAPIService = MockAPIService()
        repository = DataUSARepository(apiService: mockAPIService)
    }
    
    func testFetchNationDataSuccess() async throws {
        // Given
        let mockJSON = """
        {
            "data": [{
                "ID Nation": "01000US",
                "Nation": "United States",
                "ID Year": 2022,
                "Year": "2022",
                "Population": 331097593,
                "Slug Nation": "united-states"
            }],
            "source": []
        }
        """.data(using: .utf8)!
        mockAPIService.mockResponseData = mockJSON
        
        // When
        let data = try await repository.fetchNationData()
        
        // Then
        XCTAssertEqual(data.first?.population, 331097593)
    }
    
    func testFetchStateDataSuccess() async throws {
        // Similar structure to NationData test
    }
}
