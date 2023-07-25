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
    @StateObject private var socialMediaListManager = SocialMediaListManager()

    init() {
        FirebaseApp.configure() // Configure Firebase
    }

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(socialMediaListManager) // Add the environmentObject modifier here
        }
    }
}
