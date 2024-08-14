//
//  NationDataViewModel.swift
//  DataUSA
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import Foundation

enum ViewModelState: Equatable {
    case idle
    case loading
    case loaded
    case error(String)
}


class NationDataViewModel: ObservableObject {
    @Published var nationData: [NationData] = []
    @Published var searchText: String = ""
    @Published var state: ViewModelState = .idle
    
    private let repository: DataUSARepositoryProtocol
    
    var filteredData: [NationData] {
        guard !searchText.isEmpty else { return nationData }
        return nationData.filter {
            $0.year.contains(searchText) || String($0.population).contains(searchText)
        }
    }
    
    init(repository: DataUSARepositoryProtocol = DataUSARepository()) {
        self.repository = repository
    }
    
    @MainActor
    func fetchNationData() async {
        guard state != .loading else { return }
        state = .loading
        
        do {
            let data = try await repository.fetchNationData()
            self.nationData = data
            self.state = .loaded
        } catch {
            self.state = .error("Failed to load nation data")
        }
    }
}
