
//
//  MovieCellView.swift
//  Cinemates
//
//  Created by apprenant98 on 30/01/2025.
//

import SwiftUI

struct FilmCellView: View {
    var filmShowed : Film
    var body: some View {
        
        VStack (alignment:.leading, spacing: 8){
            Image(filmShowed.filmPoster)
                .resizable()
                .frame(width: 175,height: 259)
                .scaledToFit()
                .cornerRadius(8)
                .shadow(radius: 5)
            if filmShowed.filmName.count > 24 {
                Text("\(String(filmShowed.filmName.prefix(24)))...")
            } else {
                Text(filmShowed.filmName)
            }
            HStack (spacing: 8){
                NotePlatformCellView(notePlatformImage: .alloCineIcon, notePlatform: filmShowed.filmAlloCineRating)
                NotePlatformCellView(notePlatformImage: .logo, notePlatform: filmShowed.filmCinematesRating)
                NotePlatformCellView(notePlatformImage: .friendsTalkIcon, notePlatform: filmShowed.filmFriendsRating)
                
            }
            
            
        }
        .foregroundStyle(.cinemateWhite)
        .font(.urbanistSubHeadline())
        .fontWeight(.semibold)
    }
}


struct NotePlatformCellView : View {
    var notePlatformImage : ImageResource
    var notePlatform : Double
    var body: some View {
        HStack (spacing : 4){
            Image(notePlatformImage)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .cornerRadius(2)
            
            Text(String(format: "%.1f", notePlatform))
                
            
        }
        .frame(width:53, height:25)
        .background(Color.cinematePurpleDark)
        .cornerRadius(4)
    }
}


#Preview {
    FilmCellView(filmShowed : filmsDatabase[4])
}
