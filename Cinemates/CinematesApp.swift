//
//  CinematesApp.swift
//  Cinemates
//
//  Created by Carine ESPEJO on 30/01/2025.
//

import SwiftUI

// put TabBarView as mainView to arrive
@main
struct CinematesApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        
    }
}
