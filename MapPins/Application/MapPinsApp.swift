//
//  MapPinsApp.swift
//  MapPins
//
//  Created by Majid on 30/03/2023.
//

import SwiftUI

@main
struct MapPinsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
