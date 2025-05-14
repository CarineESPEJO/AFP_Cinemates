//
//  FilmInfoView.swift
//  Cinemates
//
//  Created by apprenant91 on 05/02/2025.
//


import SwiftUI

struct FilmInfoView: View {
    var FilmP: Film
    var body: some View {
        VStack (alignment:.leading) {
            Spacer()
            
            Text(FilmP.filmName)
                .multilineTextAlignment(.leading)
                .font(Font.custom("Staatliches-Regular", size: 50, relativeTo: .body).leading(.tight))
                .textCase(.uppercase)
                .foregroundStyle(.cinemateWhite)
                .fontWeight(.bold)
                .padding(.bottom,2)
            
            HStack {
                Text("\(FilmP.filmDate) - \(FilmP.filmGenres.joined(separator: " , "))")
                    .font(Font.custom("Urbanist-Regular", size: 16, relativeTo: .body))
                    .foregroundStyle(.cinemateGrayLight)
                
                Spacer()
                
                Text(FilmP.filmDurationHours)
                    .font(Font.custom("Urbanist-Regular", size: 16, relativeTo: .body))
                    .foregroundStyle(.cinemateGrayLight)
            }
            
            HStack {
                Image (.alloCineIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15)
                Text("Allociné")
                    .font(Font.custom("Urbanist-Regular", size: 15, relativeTo: .body))
                    .foregroundStyle(.cinemateWhite)
                
                ZStack {
                    Text("\(FilmP.filmAlloCineRating, specifier: "%.1f")")
                        .font(Font.custom("Urbanist-Regular", size: 15, relativeTo: .body))
                        .foregroundStyle(.cinemateWhite)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Color.cinemateGrayDark.opacity(0.0))
                        .overlay( RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray.opacity(0.8), lineWidth: 1))
                }
                Image (.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17)
                    .cornerRadius(1)
                    .padding(.leading, 14)
                Text ( "Cinémates")
                    .font(Font.custom("Urbanist-Regular", size: 15, relativeTo: .body))
                    .foregroundStyle(.cinemateWhite)
                ZStack {
                    Text("\(FilmP.filmCinematesRating, specifier: "%.1f")")
                        .font(Font.custom("Urbanist-Regular", size: 15, relativeTo: .body))
                        .foregroundStyle(.cinemateWhite)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Color.cinemateGrayDark.opacity(0.0))
                        .overlay( RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray.opacity(0.8), lineWidth: 1))
                }
            }
            .frame(height: 30)
            .padding(.bottom,13)
        }
        .padding(.top, 60)
    }
}
#Preview {
        FilmInfoView(FilmP:theShawshankRedemption)
//    FilmPageView(FilmP: avatarWayOfWater)
}

