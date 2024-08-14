//
//  StateDataViewModelTests.swift
//  DataUSATests
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import XCTest
@testable import DataUSA

class StateDataViewModelTests: XCTestCase {
    
    var viewModel: StateDataViewModel!
    var mockRepository: MockDataUSARepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockDataUSARepository()
        viewModel = StateDataViewModel(repository: mockRepository)
    }
    
    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func testFetchStateDataSuccess() async throws {

        mockRepository.mockStateData = [
            StateData(idState: "04000US01", state: "Alabama", idYear: 2022, year: "2022", population: 5028092, slugState: "alabama"),
            StateData(idState: "04000US06", state: "California", idYear: 2022, year: "2022", population: 39356104, slugState: "california")
        ]
        
        await viewModel.fetchStateData()
        
        XCTAssertEqual(viewModel.stateData.count, 2)
        XCTAssertEqual(viewModel.stateData.first?.population, 5028092)
        XCTAssertEqual(viewModel.stateData.last?.population, 39356104)
    }
    
    func testFetchStateDataFailure() async throws {
        mockRepository.mockStateData = []
        await viewModel.fetchStateData()
        XCTAssertTrue(viewModel.stateData.isEmpty)
    }
}
