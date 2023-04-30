//
//  CafesView.swift
//  Cafes_SwiftUI
//
//  Created by Anatoliy Ostapenko on 21.04.2023.
//

import SwiftUI

struct CafesView: View {
    @ObservedObject private var viewModel = CafesViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                SearchBarView(text: $viewModel.searchText)
                List($viewModel.filteredVendors) { $vendor in
                    CafesCellView(vendor: $vendor)
                }
                .listStyle(.plain)
                .task {
                    viewModel.loadData()
                }
                .alert(isPresented: $viewModel.hasError, error: viewModel.error) {
                    Button("OK", role: .cancel) {}
                }
                .onChange(of: viewModel.searchText) { _ in
                    viewModel.filterVendors()
                }
                .refreshable {
                    viewModel.handleRefresh()
                }
                if viewModel.filteredVendors.isEmpty {
                    GeometryReader { geometry in
                        EmptyStateView(offset: geometry.size.height / 2)
                    }
                }
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(2)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CafesView()
    }
}
