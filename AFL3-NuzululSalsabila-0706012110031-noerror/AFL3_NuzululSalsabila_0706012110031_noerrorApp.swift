//
//  AFL3_NuzululSalsabila_0706012110031_noerrorApp.swift
//  AFL3-NuzululSalsabila-0706012110031-noerror
//
//  Created by Nuzulul Salsabila on 27/04/23.
//

import SwiftUI

@main
struct AFL3_NuzululSalsabila_0706012110031_noerrorApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        .commands {
            LandmarkCommands()
        }
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
