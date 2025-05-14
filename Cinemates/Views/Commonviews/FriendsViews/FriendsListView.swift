//
//  FriendsView.swift
//  Cinemates
//
//  Created by apprenant104 on 03/02/2025.
//

import SwiftUI

struct FriendsListView: View {
    
    var body: some View {
        ZStack{
            Color.cinemateBlack
                .ignoresSafeArea()
            VStack {
                HStack{
                    Spacer()
                    Text("Mes Amis")
                        .foregroundColor(.cinemateWhite)
                        .bold()
                        .font(.staatlichesLargeTitle())
                    Spacer()
                }
                ScrollView{
                    HStack{
                        Image(.profilPic21)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("DrakZor")
                            .foregroundColor(.cinemateWhite)
                        
                        Spacer()
                    }
                    
                    
                    HStack{
                        Image(.profilPic11)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Togame13")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                        
                    }
                    
                    HStack{
                        Image(.profilPic19)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Stelladu84")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    
                    HStack{
                        Image(.profilPic12)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Blackside")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    
                    HStack{
                        Image(.profilPic5)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Lenna974")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    
                    HStack{
                        Image(.profilPic14)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Gladiator13")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    
                    HStack{
                        Image(.profilPic7)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Annie21")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    
                    HStack{
                        Image(.profilPic4)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Marco026")
                            .foregroundColor(.cinemateWhite)
                        
                        Spacer()
                    }
                    
                    
                    HStack{
                        Image(.profilPic8)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Brendi45")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                        
                    }
                    
                    HStack{
                        Image(.profilPic9)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Rhema38")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    
                    HStack{
                        Image(.profilPic15)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Camélia69")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    
                    HStack{
                        Image(.profilPic10)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Romain12")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    
                    HStack{
                        Image(.profilPic18)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("hugo_bsqt")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    HStack{
                        Image(.profilPic13)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Laprincesselily")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    
                    HStack{
                        Image(.profilPic20)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Miguel9700")
                            .foregroundColor(.cinemateWhite)
                        Spacer()
                    }
                    
                    HStack{
                        Image(.profilPic17)
                            .resizable()
                            .scaledToFill()
                            .frame(width:79, height:79)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Text("Solène91")
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
    FriendsListView()
}
