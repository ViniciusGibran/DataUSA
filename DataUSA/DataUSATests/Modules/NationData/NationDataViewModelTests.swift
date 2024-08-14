//
//  NationDataViewModelTests.swift
//  DataUSATests
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import XCTest
@testable import DataUSA

class NationDataViewModelTests: XCTestCase {
    
    var viewModel: NationDataViewModel!
    var mockRepository: MockDataUSARepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockDataUSARepository()
        viewModel = NationDataViewModel(repository: mockRepository)
    }
    
    func testFetchNationDataSuccess() async throws {
        mockRepository.mockNationData = [NationData(idNation: "01000US", nation: "United States", idYear: 2022, year: "2022", population: 331097593, slugNation: "united-states")]
        
        let expectation = XCTestExpectation(description: "Wait for fetch to complete")
        await viewModel.fetchNationData()
        
        DispatchQueue.main.async { expectation.fulfill() }
        
        await fulfillment(of: [expectation], timeout: 1.0)
        
        XCTAssertEqual(viewModel.nationData.count, 1)
        XCTAssertEqual(viewModel.nationData.first?.population, 331097593)
    }
    
    func testFetchNationDataFailure() async throws {
        mockRepository.mockNationData = []
        await viewModel.fetchNationData()
        
        XCTAssertTrue(viewModel.nationData.isEmpty)
    }
}
