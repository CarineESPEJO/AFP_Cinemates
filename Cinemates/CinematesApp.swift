//
//  CinematesApp.swift
//  Cinemates
//
//  Created by apprenant98 on 30/01/2025.
//

import SwiftUI

@main
struct CinematesApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        
    }
}
