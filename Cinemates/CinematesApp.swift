//
//  CinematesApp.swift
//  Cinemates
//
//  Created by Carine ESPEJO on 30/01/2025.
//

import SwiftUI

@main
struct CinematesApp: App {
    var body: some Scene {
        WindowGroup {
            // changed to link the opening of the app to TabBarView
            TabBarView()
                .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        
    }
}
