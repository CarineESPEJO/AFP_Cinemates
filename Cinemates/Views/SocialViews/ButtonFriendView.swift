//
//  ButtonFriendView.swift
//  Cinemates
//
//  Created by apprenant80 on 04/02/2025.
//


import SwiftUI

struct ButtonFriendView: View {
    @Binding var friendShowedButton: User
    var friendChosen: User
    
    var body: some View {
        Button {
            friendShowedButton = friendChosen
        } label: {
            VStack {
                Image(friendChosen.profilPicture)
                    .resizable()
                    .scaledToFill() // pour prendre tout l'espace en s'adaptant
                    .frame(width: 79, height: 79)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(friendShowedButton.id == friendChosen.id ? Color.cinematePurpleLight : Color.cinemateWhite, lineWidth: 1))
                    .shadow(color: (friendShowedButton.id == friendChosen.id ? Color.cinematePurpleLight.opacity(0.7) : Color.clear), radius: 10, x: 0, y: 0)
     
                Text(friendChosen.username)
                    .font(.urbanistBody())
                    .foregroundStyle(friendShowedButton.id == friendChosen.id ? Color.cinematePurpleLight : Color.cinemateWhite)
                    .shadow(color: (friendShowedButton.id == friendChosen.id ? Color.cinematePurpleLight : Color.clear), radius: 4, x: 0, y: 2)
                
            }
        }
    }
}

#Preview {
    @Previewable
    @State var previewFriend: User = janeSmith
    return ButtonFriendView(friendShowedButton: $previewFriend, friendChosen: alexTheExplorer)
}
