//
//  UserProfilView.swift
//  Cinemates
//
//  Created by apprenant98 on 30/01/2025.
//

import SwiftUI

struct UserProfilView: View {
    var body: some View {
        ZStack{
            Color.cinemateBlack
                .ignoresSafeArea()
            
            
            VStack{
                HStack{
                    Image(systemName: "gearshape")
                        .font(.system(size: 24))
                        .foregroundColor(.cinemateBlack)
                        .padding(.horizontal)
                    Spacer()
                    Text("MON COMPTE")
                        .font(Font.custom("Staatliches-Regular", size: 32, relativeTo: .body))
                        .foregroundColor(.cinemateWhite)
                    Spacer()
                    NavigationLink {
                        SettingsAppView()
                    } label: {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24))
                            .foregroundColor(.cinemateGrayDark)
                            .padding(.horizontal)
                    }
                }
                ScrollView {
                    VStack {
                        VStack{
                            
                            Image(.profilPic0)
                                .resizable()
                                .scaledToFill()
                                .frame(width:114, height:114)
                                .clipShape(Circle())
                            Text("VeuveNoiredu84")
                                .font(Font.custom("Urbanist-Regular", size: 20, relativeTo: .body))
                                .fontWeight(.bold)
                                .foregroundColor(.cinemateWhite)
                               
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            HStack{
                                Spacer()
                                HStack{
                                    
                                    VStack {
                                        Text("104")
                                            .font(Font.custom("Urbanist-Regular", size: 22, relativeTo: .body))
                                            .foregroundColor(.cinemateWhite)
                                            .bold()
                                        Text("Amis")
                                            .font(Font.custom("Urbanist-Regular", size: 20, relativeTo: .body))
                                            .foregroundColor(.cinemateWhite)
                                            .bold()
                                    }
                                    
                                }
                                
                                Spacer()
                                VStack {
                                    Text("9")
                                        .font(Font.custom("Urbanist-Regular", size: 22, relativeTo: .body))
                                        .foregroundColor(.cinemateWhite)
                                        .bold()
                                    Text("Communautés")
                                        .font(Font.custom("Urbanist-Regular", size: 20, relativeTo: .body))
                                        .foregroundColor(.cinemateWhite)
                                        .bold()
                                    
                                }
                                Spacer()
                                VStack {
                                    Text("\(veuveNoireFilms.filmsFavorites.count)")
                                        .font(Font.custom("Urbanist-Regular", size: 22, relativeTo: .body))
                                        .foregroundColor(.cinemateWhite)
                                        .bold()
                                    Text("Favoris")
                                        .font(Font.custom("Urbanist-Regular", size: 20, relativeTo: .body))
                                        .foregroundColor(.cinemateWhite)
                                        .bold()
                                }
                                Spacer()
                            }
                            .font(.urbanistHeadline())
                            .fontWeight(.bold)
                            ZStack{
                                
                                Text("Fan de films inspirés de comics, j'aimerais avoir plus de films de super héroïnes. J'aime aussi voir des films d'actions et des drama coréens où les figures féminines sont fortes.")
                                    .font(Font.custom("Urbanist-Regular", size: 15, relativeTo: .body))
                                    .padding(.horizontal,16)
                                    .padding()
                                    .foregroundColor(.cinemateWhite)
                                    .background(.cinematePurpleDark)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))                                 
                            }
                            .padding(.bottom)
                        }

                        HStack{
                            
                            Text("Favoris")
                                .font(Font.custom("Urbanist-Regular", size: 20, relativeTo: .body))
                                .foregroundColor(.cinemateWhite)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            Spacer()
                        }
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 10){
                                
                                ForEach(veuveNoireFilms.filmsFavorites) { film in NavigationLink {
                                    FilmPageView(FilmP: film)
                                } label: {
                                    
                                    FilmCellView(filmShowed: film)
                                }
                                }
                            }
                        }
                        .padding(.bottom)
                        
                        HStack{
                            
                            Text("Récemment Vus")
                                .font(Font.custom("Urbanist-Regular", size: 20, relativeTo: .body))
                                .foregroundColor(.cinemateWhite)
                                .padding(.horizontal)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        ScrollView (.horizontal, showsIndicators: false)
                        {
                            HStack (spacing: 10) {
                                
                                ForEach(veuveNoireFilms.filmsSeen) { film in NavigationLink {
                                    FilmPageView(FilmP: film)
                                    
                                } label: {
                                    
                                    FilmCellView(filmShowed: film)
                                }
                                }
                            }
                        }
                        
                    }
                    .padding()
                    HStack{
                        NavigationLink(destination: FriendsListView()) {
                            VStack {
                                HStack{
                                    Text("Amis")
                                        .font(Font.custom("Urbanist-Regular", size: 20, relativeTo: .body))
                                        .foregroundColor(.cinemateWhite)
                                        .fontWeight(.bold)
                                    
                                    Image(systemName: "chevron.forward")
                                        .foregroundColor(.cinemateWhite)
                                        .bold()
                                }
                            }
                            .padding(.horizontal,14)
                            .padding(2)
                            .background(Color.cinemateBlack)
                            .cornerRadius(8)
                            
                            
                        }
                        
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            
                            ForEach(veuveNoire.userFriends) { friend in
                                NavigationLink {
                                    FriendProfilView(friendPage: friend)
                                } label: {
                                    VStack{
                                        Image(friend.profilPicture)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width:79, height:79)
                                            .clipShape(Circle())
                                        Text("\(friend.username)")
                                            .foregroundColor(.cinemateWhite)
                                    }
                                }
                            }
                            
                            VStack{
                                Image(.profilPic21)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(Circle())
                                Text("DrakZor")
                                    .foregroundColor(.cinemateWhite)
                            }
                            
                            VStack{
                                Image(.profilPic11)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(Circle())
                                Text("Togame13")
                                    .foregroundColor(.cinemateWhite)
                            }
                            
                            VStack{
                                Image(.profilPic19)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(Circle())
                                Text("Stelladu84")
                                    .foregroundColor(.cinemateWhite)
                            }
                            
                            VStack{
                                Image(.profilPic12)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(Circle())
                                Text("Blackside")
                                    .foregroundColor(.cinemateWhite)
                            }
                            
                            VStack{
                                Image(.profilPic5)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(Circle())
                                Text("Lenna974")
                                    .foregroundColor(.cinemateWhite)
                            }
                            
                            VStack{
                                Image(.profilPic14)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(Circle())
                                Text("Gladiator13")
                                    .foregroundColor(.cinemateWhite)
                            }
                            
                            VStack{
                                Image(.profilPic7)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(Circle())
                                Text("Annie21")
                                    .foregroundColor(.cinemateWhite)
                            }
                        }
                        .font(.urbanistSubHeadline())
                        .padding()
                    }
                    HStack{
                        //     NavigationLink(destination: FriendsView())
                        
                        NavigationLink(destination: CommunityListView()) {
                            VStack {
                                HStack{
                                    Text("Communautés")
                                        .font(Font.custom("Urbanist-Regular", size: 20, relativeTo: .body))
                                        .foregroundColor(.cinemateWhite)
                                        .bold()
                                    
                                    Image(systemName: "chevron.forward")
                                        .foregroundColor(.cinemateWhite)
                                        .bold()
                                }
                            }
                            .padding()
                            .background(Color.cinemateBlack)
                            .cornerRadius(8)
                            
                            
                        }
                        
                        Spacer()
                    }
                    .font(.urbanistHeadline())
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            
                            VStack {
                                NavigationLink(destination: CommunityProfilView()) {
                                    VStack {
                                        Image(.fantastiqueCommu)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 79, height: 79)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))

                                        
                                        Text("Fan_De...")
                                            .foregroundColor(.cinemateWhite)
                                            .frame(maxWidth: .infinity) // Force l'alignement du texte
                                            .multilineTextAlignment(.center) // Centre le texte
                                    }
                                }
                            }

                                
                                VStack {
                                Image(.kdramaCommu)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))

                                Text("KD <3")
                                    .foregroundColor(.cinemateWhite)
                            }
                            VStack{
                                Image(.animeCommu)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                   
                                Text("Anime_dream")
                                    .foregroundColor(.cinemateWhite)
                            }
                            VStack{
                                Image(.gowomanCommu)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                Text("Go_Woman")
                                    .foregroundColor(.cinemateWhite)
                            }
                            VStack{
                                Image(.avengerCommu)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))

                                Text("avENgers")
                                    .foregroundColor(.cinemateWhite)
                            }
                            VStack{
                                Image(.justNetflix)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:79, height:79)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))

                                Text("Netflix_Addict")
                                    .foregroundColor(.cinemateWhite)
                            }
                        }
                        .font(.urbanistSubHeadline())
                        
                    }
                    
                }
            }
            
            
        }
        
        
    }
}

#Preview {
    UserProfilView()
    //    TabBarView()
    
}
