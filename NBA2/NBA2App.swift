//
//  NBA2App.swift
//  NBA2
//
//  Created by DHV on 04/08/2021.
//

import SwiftUI
import Firebase
@main
struct NBA2App: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataModel())
        }
    }
}
