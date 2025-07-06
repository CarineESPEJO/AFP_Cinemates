
//
//  FilmCellView.swift
//  Cinemates
//
//  Created by Carine ESPEJO on 30/01/2025.
//

import SwiftUI

//function to show cerate a cartridge of a movie
struct FilmCellView: View {
    //it's given a movie to use its infos
    var filmShowed : Film
    var body: some View {
        
        VStack (alignment:.leading, spacing: 8){
            Image(filmShowed.filmPoster) 
                .resizable()
                .frame(width: 175,height: 259)
                .scaledToFit()
                .cornerRadius(8)
                .shadow(radius: 5)
            if filmShowed.filmName.count > 24 { //if the name of the movie is too long, we take the beginning and a ...
                Text("\(String(filmShowed.filmName.prefix(24)))...")
            } else {
                Text(filmShowed.filmName)
            }
            HStack (spacing: 8){
                NotePlatformCellView(notePlatformImage: .alloCineIcon, notePlatform: filmShowed.filmAlloCineRating) //call function to show note
                NotePlatformCellView(notePlatformImage: .logo, notePlatform: filmShowed.filmCinematesRating) //same
                NotePlatformCellView(notePlatformImage: .friendsTalkIcon, notePlatform: filmShowed.filmFriendsRating) //same
                
            }
            
            
        }
        .foregroundStyle(.cinemateWhite)
        .font(.urbanistSubHeadline())
        .fontWeight(.semibold)
    }
}

//function to not repeat same code for each note parts
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
            
            Text(String(format: "%.1f", notePlatform)) // transform note into string that is one number after the virgule
                
            
        }
        .frame(width:53, height:25)
        .background(Color.cinematePurpleDark)
        .cornerRadius(4)
    }
}


#Preview {
    FilmCellView(filmShowed : filmsDatabase[4])
}
