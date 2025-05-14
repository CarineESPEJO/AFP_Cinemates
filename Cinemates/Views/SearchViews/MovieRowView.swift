import SwiftUI

struct MovieRowView: View {
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

    
    let film: Film
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(film.filmPoster)
                .resizable()
                .frame(width: 120, height: 160)
                .cornerRadius(4)
            VStack(alignment: .leading) {
                Text(film.filmName)
                    .font(.urbanistHeadline())
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Text("\(film.filmDate.prefix(4)) • \(film.filmGenres.joined(separator: ", "))")
                        .foregroundColor(.gray)
                        .padding(.bottom, 8)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Text("\(film.filmDurationHours)")
                        .foregroundColor(.gray)
                        .padding(.bottom, 8)
                        .padding(.trailing, 8)
                        .multilineTextAlignment(.leading)
                    
                }
                
                HStack(spacing: 12) {
                    RatingView(imageName: "alloCineIcon", text: film.filmAlloCineRating, color: .yellow)
                    RatingView(imageName: "logo", text: film.filmCinematesRating, color: .purple)
                    RatingView(imageName: "friendsTalkIcon", text: film.filmFriendsRating, color: .white)
                    
                    Spacer()
                }
              
                .padding(.bottom, 8)

                Text("Amis ayant vu ce film")
                    .foregroundColor(.gray)
                    .padding(.bottom, 4)

                // Utiliser ForEach avec un tableau d'éléments
                HStack(spacing: -8) {
                    ForEach(friendsRandom(), id: \.self) { friendImage in
                        Image(friendImage)
                            .resizable()
                            .frame(width: 34, height: 38)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .shadow(radius: 3)
                    }
                }
            }
        }
        .font(.urbanistSubHeadline())
        .padding(8)
        .background(Color.white.opacity(0.05))
        .cornerRadius(8)
    }
}

#Preview {
    MovieRowView(film : theBatman)
}
