//
//  ListsButtonCellView.swift
//  Cinemates
//
//  Created by Carine ESPEJO on 02/02/2025.
//

import SwiftUI



struct RandomizerView: View {
    
    @State private var critereModal : Bool = false
    
    @State private var isBouncing = false
    @State private var firstclick: Bool = true
    
    
    @State var randomizerTotalList : [Film] = filmsDatabase
    @State private var myListButton : Bool = false
    @State private var friendsButton : Bool = false
    @State private var communityButton  : Bool = false
    
    @State var filmRandomized : Film = theMatrix
    
    var friendsList: [Film] {
        var allFriendsFilms: [Film] = []
        for friend in veuveNoire.userFriends {
            allFriendsFilms.append(contentsOf: friend.userFilm.filmsToSee)
        }
        return allFriendsFilms
    }
    
    
    var communityList: [Film] {
        var allCommunityFilms: [Film] = []
        for communityMember in communityOneDatabase {
            allCommunityFilms.append(contentsOf: communityMember.userFilm.filmsToSee)
        }
        return allCommunityFilms
    }
    
    @State private var historicList : [Film] = [theGodfather,theDarkKnight, theShawshankRedemption, titanic]
    @State private var historicButton : Bool = false
    @State private var scrollToBottom: Bool = false
    @State private var buttonRightTapped : String = "Add"
    
    var body: some View {
        ZStack {
            Color.cinemateBlack
                .ignoresSafeArea(edges: .all)
            VStack  (spacing : 20){
                
                headView(criteresModal: $critereModal)
                
                
                HStack (spacing : 12) {
                    
                    Button("Tous") {
                        myListButton = false
                        friendsButton = false
                        communityButton = false
                        randomizerTotalList = filmsDatabase
                    }
                    
                    .foregroundStyle(myListButton == false && friendsButton == false && communityButton == false ? Color.cinemateWhite : Color.cinemateGrayLight )
                    .font(.urbanistHeadline())
                    .padding(.horizontal, 12)   // Ajoute un padding horizontal de 4 (gauche et droite)
                    .padding(.vertical, 4)
                    .background(myListButton == false && friendsButton == false && communityButton == false ? Color.cinematePurpleLight : Color.clear )
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20) // Ici, tu définis le rayon des coins
                            .stroke(Color.cinemateGrayDark, lineWidth: 1)) // Bordure blanche de 4 points de large
                    
                    
                    
                    ListsButtonCellView(randomizerTotalList: $randomizerTotalList, listButton: $myListButton, otherListButtonOne: $friendsButton, otherListButtonTwo: $communityButton,buttonName: "Ma liste", buttonAction: veuveNoireFilms.filmsToSee, otherButtonOneAction: friendsList, otherButtonTwoAction: communityList)
                    
                    ListsButtonCellView(randomizerTotalList: $randomizerTotalList, listButton: $friendsButton,otherListButtonOne: $myListButton, otherListButtonTwo: $communityButton,buttonName: "Amis", buttonAction: friendsList,otherButtonOneAction: veuveNoireFilms.filmsToSee, otherButtonTwoAction: communityList)
                    
                    ListsButtonCellView(randomizerTotalList: $randomizerTotalList, listButton: $communityButton,otherListButtonOne: $myListButton, otherListButtonTwo: $friendsButton, buttonName: "Communauté",buttonAction: communityList,otherButtonOneAction: veuveNoireFilms.filmsToSee, otherButtonTwoAction: friendsList)
                }
                
                VStack(spacing :  20) {
                    ZStack {
                        
                        
                        CirclesWaveAnimationView()
                        
                        Button {
                            withAnimation {
                                firstclick = false
                            }
                        } label : {
                            ZStack {
                                
                                
                                Circle()
                                    .fill(Color.cinematePurpleLight)
                                    .frame(width: 120)
                                    .shadow(color: .cinematePurpleLight, radius: 75)
                                    .scaleEffect(isBouncing ? 1.2 : 1)
                                Text("Commencer")
                            }
                            .animation(
                                .easeInOut(duration: 0.5).repeatForever(autoreverses: true), // Animation avec rebond
                                value: isBouncing
                            )
                            .onAppear {
                                isBouncing.toggle() // Démarre l'animation lorsque la vue apparaît
                            }
                            
                        }
                        .foregroundStyle(.cinemateWhite)
                        .font(.staatlichesTitle3())
                        
                        
                        if firstclick == false {
                            VStack {
                                RandomizedFilm(filmRandomized: filmRandomized)
                                
                                HStack (spacing : 36){
                                    buttonLeft(buttonLeftSymbol: "xmark", randomizerTotalList : $randomizerTotalList, filmRandomized: $filmRandomized, historicList: $historicList)
                                    
                                    
                                    buttonMiddle(randomizerTotalList: $randomizerTotalList, filmRandomized: $filmRandomized, historicList: $historicList)
                                    
                                    
                                    buttonRight(buttonRightTapped : $buttonRightTapped, buttonRightSymbolUnchecked: "eye", buttonRightSymbolChecked: "checkmark")
                                    
                                }
                                .padding(.bottom)
                                
                                Spacer()
                                
                                
                            }
                            .foregroundStyle(.cinemateGrayLight)
                            .font(.urbanistSubHeadline())
                            .padding(.vertical)
                            
                            
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    .padding(.top, 50)
                    
                    
                    Button(action: {
                        historicButton.toggle() // Déclenche l'ouverture de la feuille
                    }) {
                        HStack {
                            Text("Voir l'historique")
                        }
                        .foregroundStyle(.cinemateWhite)
                        .padding(10)
                        .font(.urbanistSubHeadline())
                        .background(Color.cinematePurpleDark)
                        .cornerRadius(20)
                        .padding(.vertical, 20)
                    }
                    .sheet(isPresented: $historicButton) {
                        // Spécifiez la vue que vous voulez afficher dans la feuille
                        RandomizerHistoricListView(listShowing: historicList)
                    }
                    
                    
                    //                        ForEach(randomizerTotalList) { list in
                    //                            Text(list.filmName)
                    //                                .foregroundColor(.white)
                    //                        }
                    
                }
            }
        }
        .onAppear {
            // Initialiser filmRandomized lorsque la vue est chargée
            filmRandomized = randomizerTotalList.randomElement()! }
    }
    
}








struct CirclesWaveAnimationView: View {
    @State private var scale: CGFloat = 0
    @State private var circles = Array(repeating: 0.0, count: 5) // Crée 5 cercles
    @State private var opacities = Array(repeating: 1.0, count: 5) // Opacité pour chaque cercle
    
    let duration: Double = 2.0
    let circleCount = 5
    let maxScale: CGFloat = 3.0
    
    var body: some View {
        ForEach(0..<circleCount, id: \.self) { index in
            Circle()
                .fill(Color.clear)
                .overlay(
                    Circle()
                        .stroke(Color.cinematePurpleLight, lineWidth: 1)
                )
                .scaleEffect(self.circles[index])
                .opacity(self.opacities[index])
                .frame(width: 150, height: 150)
            
                .onAppear {
                    // Redémarre l'animation dès qu'un cercle apparaît
                    withAnimation(
                        Animation.easeOut(duration: self.duration)
                            .delay(Double(index) * 0.5) // Délai entre chaque cercle
                            .repeatForever(autoreverses: false)
                    ) {
                        self.circles[index] = self.maxScale // Agrandissement des cercles
                        self.opacities[index] = 0.2 // Diminution de l'opacité
                    }
                }
        }
    }
}

struct buttonLeft: View {
    var buttonLeftSymbol: String
    @Binding var randomizerTotalList: [Film]
    @Binding var filmRandomized: Film
    @Binding var historicList: [Film]
    var body: some View {
        Button(action: {
            filmRandomized = randomizerTotalList.randomElement()!
        }) {
            Image(systemName: "\(buttonLeftSymbol)")
                .foregroundStyle(.red)
                .font(.title2)
                .frame(width: 49, height:49)
                .background(
                    Circle()
                        .fill(Color.cinemateGrayBubble.opacity (0.79)))
                .padding(.bottom)
            
        }
    }
}

struct buttonRight: View {
    @Binding var buttonRightTapped : String
    var buttonRightSymbolUnchecked: String
    var buttonRightSymbolChecked: String
    var body: some View {
        Button(action: {
            // Action à effectuer lorsque le bouton est pressé
            if buttonRightTapped == "Add" {
                buttonRightTapped = "ToSee"
            } else if buttonRightTapped == "ToSee" {
                buttonRightTapped = "Seen"
            } else {
                buttonRightTapped = "Add"
            }
        }) {
            if buttonRightTapped == "Add" {
                Image(systemName: "plus")
                    .foregroundStyle(.cinemateGrayLight)
                    .font(.title2)
                    .frame(width: 49, height:49)
                    .background(
                        Circle()
                            .fill(Color.cinemateGrayBubble.opacity (0.79)))
                    .padding(.bottom)
            }else if buttonRightTapped == "ToSee" {
                Image(systemName: "eye")
                    .foregroundStyle(.cinemateWhite)
                    .font(.title2)
                    .frame(width: 49, height:49)
                    .background(
                        Circle()
                            .fill(Color.cinemateGrayBubble.opacity (0.79)))
                    .padding(.bottom)
            }else {
                Image(systemName: "checkmark")
                    .foregroundStyle(.green)
                    .font(.title2)
                    .frame(width: 49, height:49)
                    .background(
                        Circle()
                            .fill(Color.cinemateGrayBubble.opacity (0.79)))
                    .padding(.bottom)
            }
            
        }
    }
}

struct buttonMiddle: View {
    @Binding var randomizerTotalList: [Film]
    @Binding var filmRandomized: Film
    @Binding var historicList: [Film]
    var body: some View {
        Button(action: {
            historicList.insert (filmRandomized, at: 0)
            filmRandomized = randomizerTotalList.randomElement()!
            
        }) {
            Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                .foregroundStyle(.cinemateWhite)
                .font(.title2)
                .frame(width: 63, height:63)
                .background(
                    Circle()
                        .fill(Color.cinematePurpleLight))
                .padding(.top)
            
        }
    }
}

struct headView: View {
    @Binding var criteresModal: Bool
    var body: some View {
        HStack {
            Image(systemName: "slider.horizontal.3")
                .foregroundStyle(.cinemateBlack)
                .font(.system(size: 16))
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.cinemateBlack, lineWidth: 1)
                )
                .padding(.horizontal)
                .padding(.vertical, 4)
            Spacer ()
            Text("Randomizer")
                .font(.staatlichesLargeTitle())
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Spacer()
            Button(action: {
                criteresModal.toggle() // Déclenche l'ouverture de la feuille
            }) {
                Image(systemName: "slider.horizontal.3")
                    .foregroundStyle(.cinemateGrayLight)
                    .font(.system(size: 16))
                    .padding(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.cinemateGrayDark, lineWidth: 1)
                    )
                    .padding(.horizontal)
                    .padding(.vertical, 4)
            }
            .sheet(isPresented: $criteresModal) {
                // Spécifiez la vue que vous voulez afficher dans la feuille
                FiltersView()
            }
        }
    }
}

struct RandomizedFilm: View {
    @State var heartTapped : Bool = false
    var filmRandomized : Film
    var body: some View {
        VStack {
            ZStack {
                NavigationLink {
                    FilmPageView(FilmP: filmRandomized)
                } label : {
                    Image(filmRandomized.filmPoster)
                        .resizable()
                        .frame(width: 228, height: 333)
                        .cornerRadius(12)
                }
                VStack {
                    HStack {
                        Button {
                            heartTapped.toggle()
                        } label: {
                            
                            Image(systemName: heartTapped ?  "heart.fill" : "heart" )
                                .foregroundColor(heartTapped ? .red : .cinemateWhite)
                                .font(.title2)
                                .frame(width: 36, height: 36)
                                .background(Color.cinemateBlack.opacity(0.7))
                                .cornerRadius(4)
                                .padding()
                                .padding(.leading, 150)
                        }
                    }
                    Spacer()
                }
            }
            Text (filmRandomized.filmName)
                .font(.staatlichesTitle2())
                .foregroundStyle(.cinemateWhite)
            HStack {
                ForEach(filmRandomized.filmGenres, id: \.self) { genre in
                    Text("\(genre)")
                }
            }
            Text("\(filmRandomized.filmDate) - \(filmRandomized.filmDurationHours)")
        }
    }
}


#Preview {
    RandomizerView()
    //    TabBarView()
}
