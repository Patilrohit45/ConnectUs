//
//  ConnectUsApp.swift
//  ConnectUs
//
//  Created by Rohit Patil on 09/07/23.
//

import SwiftUI
import Firebase

@main
struct ConnectUsApp: App {
    init() {
            FirebaseApp.configure() // Configure Firebase
        }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
