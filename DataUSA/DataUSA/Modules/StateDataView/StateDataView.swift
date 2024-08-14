//
//  StateDataView.swift
//  DataUSA
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import SwiftUI

struct StateDataView: View {
    @ObservedObject var viewModel: StateDataViewModel
    
    public init(viewModel: StateDataViewModel = StateDataViewModel()) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                if viewModel.state == .loading {
                    ProgressView().padding()
                } else if viewModel.filteredData.isEmpty {
                    Text("No data available")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.filteredData) { state in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(state.state)
                                        .font(.headline)
                                    Text("Population: \(state.population)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text("Year: \(state.year)")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle("State Population")
            .searchable(text: $viewModel.searchText)
            .onAppear {
                Task { await viewModel.fetchStateData() }
            }
            .alert(isPresented: Binding<Bool>(
                get: { viewModel.state == .error("") },
                set: { _ in viewModel.state = .idle }
            )) {
                Alert(title: Text("Error"), message: Text("Failed to load state data"), dismissButton: .default(Text("OK")))
            }
        }
    }
}
