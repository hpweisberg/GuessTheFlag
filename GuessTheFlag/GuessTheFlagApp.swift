//
//  GuessTheFlagApp.swift
//  GuessTheFlag
//
//  Created by Harrison Weisberg on 10/24/23.
//

import SwiftUI

@main
struct GuessTheFlagApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
