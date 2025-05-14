//
//  RatingView.swift
//  Cinemates
//
//  Created by apprenant98 on 04/02/2025.
//


import SwiftUI

struct RatingView: View {
    let imageName: String
    let text: Double
    let color: Color

    var body: some View {
        HStack(spacing: 2) {
            Image(imageName)
                .resizable()
                .frame(width: 16, height: 16)
            Text(String(format: "%.1f", text))
                .foregroundColor(.white)
                .font(.caption)
        }
        .padding(.horizontal, 4)
    }
}