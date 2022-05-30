//
//  AppSUIApp.swift
//  AppSUI
//
//  Created by mr spock on 5/30/22.
//

import SwiftUI

@main
struct AppSUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DashboardViewModel())
        }
    }
}
