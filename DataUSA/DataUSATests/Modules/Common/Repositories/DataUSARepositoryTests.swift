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
    
    override func tearDown() {
        repository = nil
        mockAPIService = nil
        super.tearDown()
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
        XCTAssertEqual(data.count, 1)
        XCTAssertEqual(data.first?.population, 331097593)
    }
    
    func testFetchStateDataSuccess() async throws {
        // Given
        let mockJSON = """
        {
            "data": [{
                "ID State": "04000US01",
                "State": "Alabama",
                "ID Year": 2022,
                "Year": "2022",
                "Population": 5028092,
                "Slug State": "alabama"
            }],
            "source": []
        }
        """.data(using: .utf8)!
        mockAPIService.mockResponseData = mockJSON
        
        // When
        let data = try await repository.fetchStateData()
        
        // Then
        XCTAssertEqual(data.count, 1)
        XCTAssertEqual(data.first?.population, 5028092)
    }
    
    func testFetchNationDataFailure() async throws {
        // Given
        mockAPIService.mockResponseData = nil
        
        // When/Then
        do {
            _ = try await repository.fetchNationData()
            XCTFail("Expected to throw an error, but did not.")
        } catch {
            // Test passes
        }
    }
    
    func testFetchStateDataFailure() async throws {
        // Given
        mockAPIService.mockResponseData = nil
        
        // When/Then
        do {
            _ = try await repository.fetchStateData()
            XCTFail("Expected to throw an error, but did not.")
        } catch {
            // Test passes
        }
    }
}
