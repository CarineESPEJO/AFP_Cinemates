//
//  CommunityProfilView.swift
//  Cinemates
//
//  Created by apprenant104 on 04/02/2025.
//

import SwiftUI

struct CommunityProfilView: View {
    @State var followed = false
    @State var favorite = false
    @State var bellActivated = false
    var body: some View {
        ZStack{
            Color.cinemateBlack
                .ignoresSafeArea()
            
            ScrollView{
                VStack{
                    HStack{
                        if followed {
                                Image(systemName: "heart")
                                    .font(.system(size: 24))
                                    .foregroundColor( .cinemateBlack)
                        }
                        
                            Image(systemName: "person.2")
                                .font(.system(size: 24))
                                .foregroundColor( .cinemateBlack)

                        
                        Spacer()
                        Text("Communauté")
                            .font(Font.custom("Staatliches-Regular", size: 32, relativeTo: .body))
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                        
                        if followed {
                            Button {
                                favorite.toggle()
                            } label: {
                                Image(systemName: "heart")
                                    .font(.system(size: 24))
                                    .foregroundColor(favorite ? .red : .cinemateGrayDark)
                            }
                            
                        }
                        
                        Button {
                            followed.toggle()
                        } label: {
                            Image(systemName: "person.2")
                                .font(.system(size: 24))
                                .foregroundColor(followed ? .white : .cinemateGrayDark)
                        }
                    }
                    
                    Image(.fantastiqueCommu)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 114, height: 114)
                        .clipShape(Circle())
                    Text("Fan_De_Fantastique")
                        .foregroundColor(.cinemateWhite)
                        .bold()
                }
                .padding()
                
                VStack{
                    Text("78")
                        .foregroundColor(.cinemateWhite)
                        .bold()
                    Text("Membres")
                        .foregroundColor(.cinemateWhite)
                        .bold()
                    Spacer()
                }
                Spacer()
                Spacer()
                HStack{
                    
                    Text("Les derniers ajoutés")
                        .foregroundColor(.cinemateWhite)
                        .bold()
                    
                    Spacer()
                    
                    
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        VStack{
                            Image(.lesAnimauxFantastiquesPoster)
                                .resizable()
                                .frame(width: 130, height: 193)
                            Text("Les Animaux Fa...")
                                .foregroundColor(.cinemateWhite)
                        }
                        
                        VStack{
                            Image(.leSeigneurDesAnneauxPoster)
                                .resizable()
                                .frame(width: 130, height: 193)
                            Text("Le seigneur des...")
                                .foregroundColor(.cinemateWhite)
                        }
                        
                        VStack{
                            Image(.wickedPoster)
                                .resizable()
                                .frame(width: 130, height: 193)
                            Text("Wicked")
                                .foregroundColor(.cinemateWhite)
                        }
                        
                        VStack{
                            Image(.lesAnimauxFantastiquesLesCrimesDeGrindelwaldPoster)
                                .resizable()
                                .frame(width: 130, height: 193)
                            Text("Les Animaux Fa...")
                                .foregroundColor(.cinemateWhite)
                        }
                        
                        VStack{
                            Image(.twilightPoster)
                                .resizable()
                                .frame(width: 130, height: 193)
                            Text("Twilight : Fascination")
                                .foregroundColor(.cinemateWhite)
                        }
                    }
                }
                .padding(.bottom)
                HStack {
                    
                    Text("Les préférés")
                        .foregroundColor(.cinemateWhite)
                        .bold()
                        .padding(.horizontal)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        VStack{
                            Image(.leHobbitUnVoyageInattenduPoster)
                                .resizable()
                                .frame(width: 130, height: 193)
                            Text("Le Hobbit Un...")
                                .foregroundColor(.cinemateWhite)
                        }
                        
                        VStack{
                            Image(.blancheNeigeEtLeChasseurPoster)
                                .resizable()
                                .frame(width: 130, height: 193)
                            Text("Blanche-Neige et...")
                                .foregroundColor(.cinemateWhite)
                        }
                        
                        VStack{
                            Image(.leMondeFantastiqueDOzPoster)
                                .resizable()
                                .frame(width: 130, height: 193)
                            Text("Le Monde Fanta...")
                                .foregroundColor(.cinemateWhite)
                        }
                        
                        VStack{
                            Image(.leSeptiemeFilsPoster)
                                .resizable()
                                .frame(width: 130, height: 193)
                            Text("Le Septième Fils")
                                .foregroundColor(.cinemateWhite)
                        }
                        
                        VStack{
                            Image(.leChasseurEtLaReineDesGlaces)
                                .resizable()
                                .frame(width: 130, height: 193)
                            Text("Le Chasseur et...")
                                .foregroundColor(.cinemateWhite)
                        }
                    }
                    .padding(.bottom)
                }
                
                HStack{
                    
                    NavigationLink(destination: FriendsListView()) {
                        VStack {
                            HStack{
                                Text("Membres")
                                    .foregroundColor(.cinemateWhite)
                                    .bold()
                                
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(.cinemateWhite)
                                    .bold()
                            }
                        }
                        .padding(.horizontal,20)
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
                            Image(.profilPic2)
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
                }
                    
                
                
            }
        }
    }
}

#Preview {
    CommunityProfilView()
}
