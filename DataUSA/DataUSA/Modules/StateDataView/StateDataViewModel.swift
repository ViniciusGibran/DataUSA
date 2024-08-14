//
//  StateDataViewModel.swift
//  DataUSA
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import Foundation

class StateDataViewModel: ObservableObject {
    @Published var stateData: [StateData] = []
    @Published var searchText: String = ""
    @Published var state: ViewModelState = .idle
    
    private let repository: DataUSARepositoryProtocol
    
    var filteredData: [StateData] {
        guard !searchText.isEmpty else { return stateData }
        return stateData.filter {
            $0.state.uppercased().contains(searchText.uppercased())
        }
    }
    
    init(repository: DataUSARepositoryProtocol = DataUSARepository()) {
        self.repository = repository
    }
    
    @MainActor
    func fetchStateData() async {
        guard state != .loading else { return }
        state = .loading
        
        do {
            let data = try await repository.fetchStateData()
            self.stateData = data
            self.state = .loaded
        } catch {
            self.state = .error("Failed to load state data")
        }
    }
}
