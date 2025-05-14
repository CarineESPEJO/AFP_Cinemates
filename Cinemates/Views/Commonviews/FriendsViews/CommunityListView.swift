//
//  CommunityView.swift
//  Cinemates
//
//  Created by apprenant104 on 03/02/2025.
//

import SwiftUI

struct CommunityListView: View {
    var body: some View {
        ZStack{
            Color.cinemateBlack
                .ignoresSafeArea()
            VStack {
                HStack{
                    Spacer()
                    
                    Text("Communautés")
                        .foregroundColor(.cinemateWhite)
                        .bold()
                        .font(.staatlichesLargeTitle())
                    Spacer()
                }
                ScrollView{
                    HStack  {
                        NavigationLink(destination: CommunityProfilView()) {
                            Image(.fantastiqueCommu)
                                .resizable()
                                .scaledToFill()
                                .frame(width:79, height:79)
                                .clipShape(Circle())
                                .padding(.trailing)
                            Text("Fan_De_Fantastique")
                                .foregroundColor(.cinemateWhite)
                            
                            Spacer()
                        }
                    }
                    HStack{
                        NavigationLink(destination: CommunityProfilTwoView()){
                            Image(.escapeThrillerCommu)
                                .resizable()
                                .scaledToFill()
                                .frame(width:79, height:79)
                                .clipShape(Circle())
                                .padding(.trailing)
                            Text("Escape_Thriller")
                                .foregroundColor(.cinemateWhite)
                            Spacer()
                        }
                    }
                    HStack{
                        Image(.kdramaCommu)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("KD <3")
                            .foregroundColor(.cinemateWhite)
                        
                        Spacer()
                    }
                    HStack{
                        Image(.animeCommu)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Anime_dream")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    HStack{
                        Image(.gowomanCommu)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Go_Woman")
                            .foregroundColor(.cinemateWhite)
                        
                        Spacer()
                    }
                    HStack{
                        Image(.avengerCommu)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("avENgers")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    HStack{
                        Image(.justNetflix)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Netflix_Addict")
                            .foregroundColor(.cinemateWhite)
                        
                        Spacer()
                    }
                    HStack{
                        Image(.cinéphileCommu)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Cinéphiles_Luxurious")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                        
                    }
                }
            }
            .padding(.horizontal, 24)
            .font(.urbanistSubHeadline())
        }
    }
}

#Preview {
    CommunityListView()
}
