//
//  SwiftConcurrencyAppApp.swift
//  SwiftConcurrencyApp
//
//  Created by Mario Ban on 07.02.2025..
//

import SwiftUI

@main
struct SwiftConcurrencyAppApp: App {
    var body: some Scene {
        WindowGroup {
            DownloadImageAsync()
        }
    }
}
