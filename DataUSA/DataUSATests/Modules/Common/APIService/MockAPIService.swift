//
//  MockAPIService.swift
//  DataUSATests
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import Foundation
@testable import DataUSA

class MockAPIService: APIServiceProtocol {
    var mockResponseData: Data?
    
    func performRequest<T: Decodable>(with url: URL) async throws -> T {
        guard let data = mockResponseData else {
            throw NSError(domain: "No mock data", code: 0, userInfo: nil)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
