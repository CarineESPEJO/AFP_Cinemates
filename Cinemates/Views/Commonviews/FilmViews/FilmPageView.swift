//
//  FilmInfoView.swift
//  Cinemates
//
//  Created by apprenant?? on 05/02/2025.
// Parts added by Carine ESPEJO at line 154 and more
//

import SwiftUI

struct FilmPageView: View {
    
    var FilmP: Film
    
    var profilPicsFriend = ["profilPic2", "profilPic4", "profilPic5", "profilPic7", "profilPic8", "profilPic9"]
    
    func friendsRandom() -> [String] {
        var addFriends = [String]()
        var availableFriends = profilPicsFriend
        
        let randomNumber = Int.random(in: 1...6)
        
        for _ in 0..<randomNumber {
            if let randomFriend = availableFriends.randomElement() {
                addFriends.append(randomFriend)
                if let index = availableFriends.firstIndex(of: randomFriend) {
                    availableFriends.remove(at: index)
                }
            }
        }
        
        return addFriends
    }
    
    
    
    var body: some View {
        
        ZStack {
            Color.cinemateBlack.ignoresSafeArea()
            
            ScrollView {
                ZStack(alignment:.top) {
                    Image(FilmP.filmPoster)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height : UIScreen.main.bounds.width * 1.5)
                        .ignoresSafeArea()
                    
                    LinearGradient(gradient: Gradient(colors: [Color.cinemateBlack.opacity(1.7),Color.cinemateBlack.opacity(1.4),Color.cinemateBlack.opacity(1), Color.clear]), startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        FilmInfoView(FilmP: FilmP)
                            .padding(.horizontal)
                            .padding(.top, 200)
                    
                        ToggleNotationFilmView(FilmP: FilmP)
                            .padding(.horizontal)
                        
                        
                        HStack (spacing: 10) {
                            
                            Text("A voir sur :")
                                .font(Font.custom("Urbanist-Regular", size: 20, relativeTo: .body))
                                .fontWeight(.semibold)
                                .foregroundStyle(.cinemateWhite)
//                                .padding(.leading, 12)
                            
                            
                            ForEach(FilmP.filmPlatforms.keys.sorted(), id: \.self) { platform in
                                if let icon = FilmP.filmPlatforms[platform] {
                                    Image(icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 55, height: 55)
                                        .cornerRadius(8)
                                        .foregroundColor(.cinemateWhite)
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        
                        Text("\(FilmP.filmDescription)")
                            .padding(.horizontal)
                            .font(.urbanistHeadline())
                            .foregroundStyle(.cinemateWhite)
                            .multilineTextAlignment(.leading)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 10)
                        
                        
                        
                        
                        Text("Ces amis ont vu ce film :")
                            .font(Font.custom("Urbanist-Regular", size: 20, relativeTo: .body))
                            .fontWeight(.semibold)
                            .foregroundStyle(.cinemateWhite)
                            .padding(.horizontal)
                            .padding(.bottom, -5)
                        
                        VStack(alignment:.leading){
                            HStack(spacing: -8) {
                                ForEach(friendsRandom(), id: \.self) { friendImage in
                                    Image(friendImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.cinemateGrayBubble, lineWidth: 1))
                                        .shadow(radius: 3)
                                }
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 30)
                        .frame(width: 400, height: 90)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.cinemateGrayBubble.opacity(0.6))
                                .padding(.horizontal))
                    
                        VStack (spacing : 20) {
                            
                            
                            VStack(alignment: .leading) {
                                Text("Casting")
                                    .foregroundStyle(.cinemateWhite)
                                    .font(Font.custom("Urbanist-Regular", size: 20))
                                    .fontWeight(.semibold)
                                
                                HStack {
                                    ForEach(Array(FilmP.filmCasting), id: \.key) { cast in
                                        VStack {
                                            Image(cast.value)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 70, height: 70)
                                                .clipShape(Circle())
                                            Text("\(cast.key)")
                                                .frame(width: 65, height: 30)
                                                .multilineTextAlignment(.center)
                                                .font(.urbanistBody())
                                                .foregroundColor(.cinemateWhite)
                                        }
                                    }
                                    Spacer ()
                                }
                            }
                            // I added this part of code to call the trailer of the movie on its description page
                            VStack (alignment: .leading) {
                                Text("Bande-annonce")
                                    .foregroundStyle(.cinemateWhite)
                                    .font(Font.custom("Urbanist-Regular", size: 20))
                                    .fontWeight(.semibold)
                                FilmTrailerCellView(film: FilmP)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    FilmPageView(FilmP: avatarWayOfWater)
}


//Film(filmName: "The Matrix", filmPoster: .theMatrixPoster, filmDate: "1999", filmGenres:  ["Action", "Sci-Fi"], filmDurationMinutes: 136, filmAlloCineRating: 4.7, filmCinematesRating: 4.9, filmFriendsRating: 3.2, filmPlatforms: ["Netflix": .netflixIcon,"HBO Max": .hboIcon ], filmDescription: "Thomas Anderson, alias Neo, découvre que la réalité est une illusion contrôlée par des machines. Guidé par Morpheus et Trinity, il apprend à défier les lois de ce monde. Sa quête le mène à devenir l’élu capable de libérer l’humanité.", filmCasting: [  "Keanu Reeves": .keanuReevesPicture, "Carrie-Anne Moss": .carrieAnneMossPicture], filmTrailer: URL(string: "https://www.imdb.com/fr/title/tt0133093/?ref_=ext_shr_lnk")!
//)

