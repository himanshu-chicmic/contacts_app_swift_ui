//
//  ContactsAppSwiftUIApp.swift
//  ContactsApplication
//
//  Created by Himanshu on 4/17/23.
//

import SwiftUI

@main
struct ContactsApplication: App {
    // persistence controller's shared instace
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContactsListView()
                // set environment variable for managedObjectContext
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
