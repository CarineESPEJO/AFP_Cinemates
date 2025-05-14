//
//  TabBarView.swift
//  Cinemates
//
//  Created by apprenant98 on 30/01/2025.
//

import SwiftUI

struct TabBarView: View {
    @State var LoggedIn = true
    @State var selectedIndex = 0
    
    let icons = [
        "movieclapper",
        "magnifyingglass",
        "dice",
        "person.2",
        "person.crop.circle",
    ]
    
    let text = [
        "Liste",
        "Recherche",
        "Random",
        "Amis",
        "Profil"
    ]
    
    var body: some View {
        
        VStack {
            switch selectedIndex {
            case 0:
                NavigationStack {
                    MyMovieListView()
                            }
            case 1:
                NavigationStack {
                    SearchListView()

                }
            case 2:
                NavigationStack {
                    RandomizerView()
                }
            case 3:
                NavigationStack {
                    FeedSocialView ()
                }
            default:
                NavigationStack {
                    UserProfilView()
                }
            }
            
            Spacer()
            //            Divider()
            HStack(alignment: .bottom) {
                ForEach(0..<5, id: \.self) { number in
                    Spacer()
                    Button {
                        self.selectedIndex = number
                    } label: {
                        if number == 2 {
                            ZStack {
                                Circle()
                                    .stroke(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.cinematePurpleMid, Color.cinematePurpleLight]), startPoint: .top, endPoint: .bottom), lineWidth: 6)
                                VStack {
                                    Image(systemName: icons[number])
                                        .font(.system(size: 30, weight: .regular, design: .default))
                                        .foregroundStyle(.cinemateWhite)
                                        .fontWeight(selectedIndex == number ? .bold : .regular)
                                        .padding(1)
                                        .shadow(color: selectedIndex == number ? Color.cinemateWhite.opacity(0.70) : .clear, radius: 8, x: 0, y: 6)
                                    Text(text[2])
                                        .font(Font.custom("Urbanist-Regular", size: 12, relativeTo: .body))
                                        .fontWeight(.medium)
                                        .foregroundStyle(.cinemateWhite)
                                    
                                }
                                
                                .frame(width: 75, height: 75)
                                .background(.cinematePurpleLight)
                                .cornerRadius(40)
                                .shadow(color: Color.cinematePurpleLight.opacity(0.95), radius: 18, x: 0, y: 6)
                            }
                        } else {
                            VStack {
                                ZStack(alignment: .bottom) {
                                    Rectangle()
                                        .foregroundStyle(.clear)
                                        .frame(height: 30)
                                    Image(systemName: icons[number])
                                        .font(.system(size: 25, weight: .regular, design: .default))
                                        .foregroundStyle(selectedIndex == number ? .cinemateWhite  : .cinemateGrayDark)
                                        .fontWeight(selectedIndex == number ? .bold : .regular)
                                }
                                Text(text[number])
                                    .padding(.top, 5)
                                    .font(.urbanistBody())
                                    .foregroundStyle(selectedIndex == number ? .cinemateWhite : .cinemateGrayDark)
                                    .fontWeight(selectedIndex == number ? .bold : .regular)
                            }
                            
                        }
                        
                    }
                    
                    Spacer()
                }
                
                
            }
            .fullScreenCover(isPresented: $LoggedIn) {
                LoginView(showingLoginScreen: $LoggedIn)
            }
           
            
            
        }
        .foregroundStyle(.cinemateWhite)
        .background(Color.cinemateBlack)
        
    }
}
#Preview {
    TabBarView()
}
