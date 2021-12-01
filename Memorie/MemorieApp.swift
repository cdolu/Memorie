//
//  MemorieApp.swift
//  Memorie
//
//  Created by Ceren DOLU on 26.10.2021.
//

import SwiftUI

@main
struct MemorieApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
