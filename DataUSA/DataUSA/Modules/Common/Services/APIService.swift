//
//  APIService.swift
//  DataUSA
//
//  Created by Vinicius Gibran on 14/08/2024.
//


import Foundation
import Combine

protocol APIServiceProtocol {
    func performRequest<T: Decodable>(with url: URL) async throws -> T
}

class APIService: APIServiceProtocol {
    static let shared = APIService()
    
    private init() {}
    
    func performRequest<T: Decodable>(with url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
    }
}

