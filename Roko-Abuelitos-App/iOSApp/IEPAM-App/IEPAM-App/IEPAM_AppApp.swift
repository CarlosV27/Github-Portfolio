//
//  IEPAM_AppApp.swift
//  IEPAM-App
//
//  Created by Alumno on 29/09/22.
//

import SwiftUI

@main
struct IEPAM_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Inicio()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
