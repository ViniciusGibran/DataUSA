//
//  DataUSAApp.swift
//  DataUSA
//
//  Created by Vinicius Gibran on 14/08/2024.
//

import SwiftUI

@main
struct DataUSAApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct ContentView: View {
    var body: some View {
        MainTabView()
    }
}


struct MainTabView: View {
    var body: some View {
        TabView {
            NationDataView()
                .tabItem {
                    Text("Nation")
                }
            StateDataView()
                .tabItem {
                    Text("Satate")
                }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
