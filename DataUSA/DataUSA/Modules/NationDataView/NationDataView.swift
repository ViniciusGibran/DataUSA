//
//  NationDataView.swift
//  DataUSA
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import SwiftUI

struct NationDataView: View {
    @ObservedObject var viewModel: NationDataViewModel
    
    public init(viewModel: NationDataViewModel = NationDataViewModel()) {
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
                        ForEach(viewModel.filteredData) { nation in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(nation.year)
                                        .font(.headline)
                                    Text("Population: \(nation.population)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Nation Population")
            .searchable(text: $viewModel.searchText)
            .onAppear {
                Task { await viewModel.fetchNationData() }
            }
            .alert(isPresented: Binding<Bool>(
                get: { viewModel.state == .error("") },
                set: { _ in viewModel.state = .idle }
            )) {
                Alert(title: Text("Error"), message: Text("Failed to load nation data"), dismissButton: .default(Text("OK")))
            }
        }
    }
}
