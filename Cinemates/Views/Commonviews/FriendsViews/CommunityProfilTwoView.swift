//
//  CommunityProfilTwoView.swift
//  Cinemates
//
//  Created by apprenant104 on 05/02/2025.
//

import SwiftUI

struct CommunityProfilTwoView: View {
    @State var bellActivated = false
    var body: some View {
            ZStack{
                Color.cinemateBlack
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        HStack{
                            Image(systemName: "bell")
                                .font(.system(size: 24))
                                .foregroundColor(.cinemateBlack)
                            Spacer()
                            Text("communauté")
                                .font(Font.custom("Staatliches-Regular", size: 32, relativeTo: .body))
                                .foregroundColor(.cinemateWhite)
                            Spacer()
                            Button {
                                bellActivated.toggle()
                            } label: {
                                Image(systemName: "bell")
                                    .font(.system(size: 24))
                                    .foregroundColor(bellActivated ? .white : .cinemateGrayDark)
                            }
                        }
                        
                        Image(.escapeThrillerCommu)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 114, height: 114)
                            .clipShape(Circle())
                        Text("Escape_Thriller")
                            .foregroundColor(.cinemateWhite)
                            .bold()
                    }
                    .padding()
                    
                    VStack{
                        Text("91")
                            .font(Font.custom("Urbanist-Regular", size: 22, relativeTo: .body))
                            .foregroundColor(.cinemateWhite)
                            .bold()
                        Text("Membres")
                            .font(Font.custom("Urbanist-Regular", size: 20, relativeTo: .body))
                            .foregroundColor(.cinemateWhite)
                            .bold()
                        Spacer()
                    }
                    Spacer()
                    Spacer()
                    HStack{
                        
                        Text("Les derniers ajouté dans Escape_Thriller")
                            .foregroundColor(.cinemateWhite)
                            .bold()
                        
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            VStack{
                                Image(.companionPoster)
                                    .resizable()
                                    .frame(width: 130, height: 193)
                             
                            }
                            
                            VStack{
                                Image(.screamVIPoster)
                                    .resizable()
                                    .frame(width: 130, height: 193)
                       
                            }
                            
                            VStack{
                                Image(.lesGuetteursPoster)
                                    .resizable()
                                    .frame(width: 130, height: 193)
                               
                            }
                            
                            VStack{
                                Image(.trapPoster)
                                    .resizable()
                                    .frame(width: 130, height: 193)
                                
                            }
                            
                            VStack{
                                Image(.abigailPoster)
                                    .resizable()
                                    .frame(width: 130, height: 193)
                              
                            }
                        }
                    }
                    .padding(.bottom)
                    HStack{
                        
                        Text("Les préférés des Escape_Thriller")
                            .foregroundColor(.cinemateWhite)
                            .bold()
                            .padding(.horizontal)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            VStack{
                                Image(.hushPoster)
                                    .resizable()
                                    .frame(width: 130, height: 193)
                               
                            }
                            
                            VStack{
                                Image(.escapeGamePoster)
                                    .resizable()
                                    .frame(width: 130, height: 193)
                            
                            }
                            
                            VStack{
                                Image(.sawXPoster)
                                    .resizable()
                                    .frame(width: 130, height: 193)
                             
                            }
                            
                            VStack{
                                Image(.pearlPoster)
                                    .resizable()
                                    .frame(width: 130, height: 193)
                             
                            }
                            
                            VStack{
                                Image(.halloween)
                                    .resizable()
                                    .frame(width: 130, height: 193)
                             
                            }
                        }
                    }
                
                        
                    
                    
                }
            }
        }
    }


#Preview {
    CommunityProfilTwoView()
}
