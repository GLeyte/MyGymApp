//
//  MyGymAppApp.swift
//  MyGymApp
//
//  Created by Gabriel Leite on 20/12/24.
//

import SwiftUI
import SwiftData

@main
struct MyGymAppApp: App {
    
    @MainActor
    let sharedModelContainer: ModelContainer = {
        let schema = Schema(versionedSchema: SchemaLatest.self)
        //TODO: Change `isStoredInMemoryOnly` to `false`
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
        .modelContainer(sharedModelContainer)
    }
}
