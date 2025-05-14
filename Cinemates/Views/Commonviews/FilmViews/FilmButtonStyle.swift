//
//  FilmButtonStyle.swift
//  Cinemates
//
//  Created by apprenant91 on 04/02/2025.
//

import Foundation
import SwiftUI

struct FilmButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: 135, maxHeight: 40)
            .background(Capsule().fill(Color.cinemateGrayBubble).opacity(0.4))
            .overlay(Capsule().strokeBorder(Color.cinemateGrayDark.opacity(0.6), lineWidth: 2))
            .foregroundColor(.cinemateWhite)
    }
}

