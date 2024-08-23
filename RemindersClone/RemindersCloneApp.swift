//
//  RemindersCloneApp.swift
//  RemindersClone
//
//  Created by Aaron Graves on 8/22/24.
//

import SwiftUI

@main
struct RemindersCloneApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MyListsScreen()
            }.modelContainer(for: MyList.self)
        }
    }
}
