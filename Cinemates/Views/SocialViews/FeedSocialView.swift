//
//  FeedSocialView.swift
//  Cinemates
//
//  Created by apprenant80 on 04/02/2025.
//

import SwiftUI

struct FeedSocialView: View {
    
    @State var selectedCategory: String = "Amis"
    
    init() { // Pour modifier apparence du Segmented Control Picker
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.cinematePurpleLight)
        UISegmentedControl.appearance().setTitleTextAttributes([
            .foregroundColor: UIColor.cinemateWhite,
            .font: UIFont(name: "Staatliches-Regular", size: 16)!], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([
            .foregroundColor: UIColor.cinemateGrayLight,
            .font: UIFont(name: "Staatliches-Regular", size: 16)!], for: .normal)
    }
    
    var body: some View {
        ZStack {
            Color.cinemateBlack
                .ignoresSafeArea()
            VStack {
                Text("FIL D'ACTUALITÉS")
                    .font(.staatlichesLargeTitle())
                    .foregroundStyle(.cinemateWhite)
                
                Picker("Catégorie", selection: $selectedCategory) {
                    Text("Amis")
                        .tag("Amis")
                    Text("Communautés")
                        .tag("Communautés")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .colorScheme(.dark)
                .padding(.bottom)
                
                ScrollView {
                    if selectedCategory == "Amis" {
                        SocialFriendsView()
                    } else if selectedCategory == "Communautés" {
                        SocialCommunityView()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}
#Preview {
    FeedSocialView()
}


struct SocialFriendsView: View {
    @State var friendShowed: User = veuveNoire.userFriends[0]
    
    var userSuggestions: [User] {
        usersDatabase.filter { friend in
            !veuveNoire.userFriends.contains { $0.id == friend.id }
        }
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mes Amis")
                .font(.urbanistHeadline())
                .fontWeight(.semibold)
                .foregroundStyle(.cinemateWhite)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(veuveNoire.userFriends) { friend in
                        ButtonFriendView(friendShowedButton: $friendShowed, friendChosen: friend)
                    }
                }
            }
            Text("Derniers films vus de mes amis")
                .font(.urbanistHeadline())
                .fontWeight(.semibold)
                .foregroundStyle(.cinemateWhite)
                .padding(.top, 20)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(friendShowed.userFilm.filmsToSee) { film in NavigationLink {
                        FilmPageView(FilmP: film)
                    } label: {
                        FilmCellView(filmShowed: film)
                    }
                    }
                }
            }
            Text("Films favoris de mes amis")
                .font(.urbanistHeadline())
                .fontWeight(.semibold)
                .foregroundStyle(.cinemateWhite)
                .padding(.top, 20)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(friendShowed.userFilm.filmsFavorites) { film in NavigationLink {
                        FilmPageView(FilmP: film)
                    } label: {
                        FilmCellView(filmShowed: film)
                    }
                    }
                }
            }
            
            //            Text("Dernieres notes de mes amis")
            //                .font(.urbanistHeadline())
            //                .fontWeight(.semibold)
            //                .foregroundStyle(.cinemateWhite)
            //                .padding(.top, 20)
            // A revoir car on veut mettre les derniers films notés de nos amis : pour l'instant on ne fait pas on verra si on a le temps
            
            Text("Suggestions d'amis")
                .font(.urbanistHeadline())
                .fontWeight(.semibold)
                .foregroundStyle(.cinemateWhite)
                .padding(.top, 20)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(userSuggestions) { suggestion in
                        VStack {
                            Image(suggestion.profilPicture)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 79, height: 79)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(lineWidth: 1))
                            
                            Text(suggestion.username)
                                .font(.urbanistBody())
                                .foregroundStyle(.cinemateWhite)
                        }
                    }
                }
            }
        }
    }
}

struct SocialCommunityView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mes communautés")
                .font(.urbanistHeadline())
                .fontWeight(.semibold)
                .foregroundStyle(.cinemateWhite)
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    VStack{
                        Image(.profilPic21)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.cinematePurpleLight, lineWidth: 1))
                            .shadow(color: .cinematePurpleLight.opacity(0.7), radius: 10, x: 0, y: 0)
                        Text("VadorFans")
                            .foregroundStyle(.cinematePurpleLight)
                    }
                    VStack{
                        Image(.profilPic11)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1))
                        Text("StudioGhibli")
                    }
                    VStack{
                        Image(.profilPic19)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1))
                        Text("AnimesEnChaine")
                    }
                    VStack{
                        Image(.profilPic12)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1))
                        Text("SeinenLife")
                    }
                    VStack{
                        Image(.profilPic14)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1))
                        Text("Gladiator13")
                    }
                    VStack{
                        Image(.profilPic7)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1))
                        Text("GameOfThrones")
                    }
                }
                .foregroundStyle(.cinemateWhite)
                .font(.urbanistBody())
            }
            Text("Derniers films vus de ma communauté")
                .font(.urbanistHeadline())
                .fontWeight(.semibold)
                .foregroundStyle(.cinemateWhite)
                .padding(.top, 20)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(veuveNoire.userFilm.filmsToSee) { film in NavigationLink {
                        FilmPageView(FilmP: film)
                    } label: {
                        FilmCellView(filmShowed: film)
                    }
                    }
                }
            }
            Text("Films favoris de ma communauté")
                .font(.urbanistHeadline())
                .fontWeight(.semibold)
                .foregroundStyle(.cinemateWhite)
                .padding(.top, 20)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(veuveNoire.userFilm.filmsSeen) { film in NavigationLink {
                        FilmPageView(FilmP: film)
                    } label: {
                        FilmCellView(filmShowed: film)
                    }
                    }
                }
            }
            //            Text("Dernieres notes de mes amis")
            //                .font(.urbanistHeadline())
            //                .fontWeight(.semibold)
            //                .foregroundStyle(.cinemateWhite)
            //                .padding(.top, 20)
            // A revoir car on veut mettre les derniers films notés de nos amis : pour l'instant on ne fait pas on verra si on a le temps
            
            Text("Suggestions de communautés")
                .font(.urbanistHeadline())
                .fontWeight(.semibold)
                .foregroundStyle(.cinemateWhite)
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    
                    VStack{
                        Image(.profilPic14)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1))
                        Text("Gladiator13")
                    }
                    VStack{
                        Image(.profilPic7)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1))
                        Text("GameOfThrones")
                    }
                        VStack{
                            Image(.profilPic21)
                                .resizable()
                                .scaledToFill()
                                .frame(width:79, height:79)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1))
                            Text("VadorFans")
                                
                        }
                        VStack{
                            Image(.profilPic11)
                                .resizable()
                                .scaledToFill()
                                .frame(width:79, height:79)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1))
                            Text("StudioGhibli")
                        }
                        VStack{
                            Image(.profilPic19)
                                .resizable()
                                .scaledToFill()
                                .frame(width:79, height:79)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1))
                            Text("AnimesEnChaine")
                        }
                        VStack{
                            Image(.profilPic12)
                                .resizable()
                                .scaledToFill()
                                .frame(width:79, height:79)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1))
                            Text("SeinenLife")
                        }
                }
                .foregroundStyle(.cinemateWhite)
                .font(.urbanistBody())
            }
            
//            ScrollView (.horizontal, showsIndicators: false) {
//                HStack {
//                    ForEach(userSuggestions) { suggestion in
//                        VStack {
//                            Image(suggestion.profilPicture)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 79, height: 79)
//                                .clipShape(Circle())
//                                .overlay(Circle().stroke(lineWidth: 1))
//                            
//                            Text(suggestion.username)
//                                .font(.urbanistBody())
//                                .foregroundStyle(.cinemateWhite)
//                        }
//                    }
//                }
//            }
        }
    }
}
