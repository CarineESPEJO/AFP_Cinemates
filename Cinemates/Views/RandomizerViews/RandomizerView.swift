//
//  RandomizerView.swift
//  Cinemates
//
//  Created by Carine ESPEJO on 02/02/2025.
//

import SwiftUI

// It's an app POC, not all functionalities are fully developped or like it would have been in the real app (ex: use the criterias to choose the movies with in the lists activated)

struct RandomizerView: View {
    //criteria page toggle var
    @State private var critereModal : Bool = false

    //var toggled each 0.5s to create circle bounce effect
    @State private var isBouncing = false
    //hide circle agfter first click on it
    @State private var firstclick: Bool = true
    
    // var randomizer list
    @State var randomizerTotalList : [Film] = filmsDatabase

   // variables to activates/desactivates this list in randomizer
    @State private var myListButton : Bool = false
    @State private var friendsButton : Bool = false
    @State private var communityButton  : Bool = false

    //film randomized, neeeded to have something at the beginning to work
    @State var filmRandomized : Film = theMatrix

    // var which take alll the films from the list of the friends of VeuveNoire, didn't have time to make it that there is no duplicate
    var friendsList: [Film] {
        var allFriendsFilms: [Film] = []
        for friend in veuveNoire.userFriends {
            allFriendsFilms.append(contentsOf: friend.userFilm.filmsToSee)
        }
        return allFriendsFilms
    }
    
    //same but with the communities
    var communityList: [Film] {
        var allCommunityFilms: [Film] = []
        for communityMember in communityOneDatabase {
            allCommunityFilms.append(contentsOf: communityMember.userFilm.filmsToSee)
        }
        return allCommunityFilms
    }

    // historic List with some film already inside for presentation to go faster
    @State private var historicList : [Film] = [theGodfather,theDarkKnight, theShawshankRedemption, titanic]
    //Show/Hide historic page
    @State private var historicButton : Bool = fals
    @State private var scrollToBottom: Bool = false
    // fake button, toggle its aspect
    @State private var buttonRightTapped : String = "Add"
    
    var body: some View {
        ZStack {
            Color.cinemateBlack //background color
                .ignoresSafeArea(edges: .all)
            VStack  (spacing : 20){
                
                headView(criteresModal: $critereModal)
                
                //lists to be chosen
                //we didn't have time but we wanted that if we press during a certain time the buttons, we can choose which profil/group is activated in that button
                HStack (spacing : 12) { 
                    // disable estetiques all the of the  other buttons and link the randomizer list to the list of all the movies
                    Button("Tous") {
                        myListButton = false
                        friendsButton = false
                        communityButton = false
                        randomizerTotalList = filmsDatabase
                    }
                    // if one or more of the other buttons are activated, this one is disactivated so its style change
                    .foregroundStyle(myListButton == false && friendsButton == false && communityButton == false ? Color.cinemateWhite : Color.cinemateGrayLight )
                    .font(.urbanistHeadline())
                    .padding(.horizontal, 12) 
                    .padding(.vertical, 4)
                    //same
                    .background(myListButton == false && friendsButton == false && communityButton == false ? Color.cinematePurpleLight : Color.clear )
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20) 
                            .stroke(Color.cinemateGrayDark, lineWidth: 1))
                    
                    //function to create one of the 3 other buttons
                    ListsButtonCellView(randomizerTotalList: $randomizerTotalList, listButton: $myListButton, otherListButtonOne: $friendsButton, otherListButtonTwo: $communityButton,buttonName: "Ma liste", buttonAction: veuveNoireFilms.filmsToSee, otherButtonOneAction: friendsList, otherButtonTwoAction: communityList)
                    
                    //same
                    ListsButtonCellView(randomizerTotalList: $randomizerTotalList, listButton: $friendsButton,otherListButtonOne: $myListButton, otherListButtonTwo: $communityButton,buttonName: "Amis", buttonAction: friendsList,otherButtonOneAction: veuveNoireFilms.filmsToSee, otherButtonTwoAction: communityList)

                     //same
                    ListsButtonCellView(randomizerTotalList: $randomizerTotalList, listButton: $communityButton,otherListButtonOne: $myListButton, otherListButtonTwo: $friendsButton, buttonName: "Communauté",buttonAction: communityList,otherButtonOneAction: veuveNoireFilms.filmsToSee, otherButtonTwoAction: friendsList)
                }
                
                VStack(spacing :  20) {
                    ZStack {

                        //view to create the circle wave effect
                        CirclesWaveAnimationView()
                        
                        Button {  //button to start randomizer, is hidden after to let the space to the movie randomized and the other buttons
                            withAnimation {
                                firstclick = false
                            }
                        } label : {
                            ZStack {
                                Circle()
                                    .fill(Color.cinematePurpleLight)
                                    .frame(width: 120)
                                    .shadow(color: .cinematePurpleLight, radius: 75)
                                    //when isBouncing activated, the cicrle is 1.2, when not its 1 to crate bounce effect
                                    .scaleEffect(isBouncing ? 1.2 : 1) 
                                Text("Commencer")
                            }
                            //each 0.5s, toggle isBouncing to create the animation of bounce 
                            .animation(
                                .easeInOut(duration: 0.5).repeatForever(autoreverses: true), 
                                value: isBouncing
                            )
                            // start the animation when we arrive on the page
                            .onAppear {
                                isBouncing.toggle() 
                            }
                            
                        }
                        .foregroundStyle(.cinemateWhite)
                        .font(.staatlichesTitle3())
                        
                        
                        if firstclick == false { //after 1st click show film randomized
                            VStack {
                                RandomizedFilm(filmRandomized: filmRandomized) //function to randomize a film
                                
                                HStack (spacing : 36){
                                    //function to delete movie from randomizer list and add it to the historique
                                    buttonLeft(buttonLeftSymbol: "xmark", randomizerTotalList : $randomizerTotalList, filmRandomized: $filmRandomized, historicList: $historicList)
                                    
                                     //randomize nesw film
                                    buttonMiddle(randomizerTotalList: $randomizerTotalList, filmRandomized: $filmRandomized, historicList: $historicList)
                                    
                                    //fake button, to add the randomized film to our own list
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
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2) //to be half of the screen sze
                    .padding(.top, 50)
                    
                    
                    Button(action: {
                        historicButton.toggle() // Toggle to show the history page
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
                    //Show the history page
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
            // Initialize filmRandomized when view is loaded
            filmRandomized = randomizerTotalList.randomElement()! }
    }
    
}

//Animation of circle waves in the background
struct CirclesWaveAnimationView: View {
    @State private var scale: CGFloat = 0
    @State private var circles = Array(repeating: 0.0, count: 5) // Create a size for each the 5 circles
    @State private var opacities = Array(repeating: 1.0, count: 5) // Same with opacity

    //Duration of the animation for each circle
    let duration: Double = 2.0
    //number of cirles
    let circleCount = 5
    //limit of size
    let maxScale: CGFloat = 3.0
    
    var body: some View {
        // Loops through 0 to 4 (5 circles), with each index uniquely identified using \.self
        ForEach(0..<circleCount, id: \.self) { index in
            Circle()
                .fill(Color.clear)
                .overlay(
                    Circle()
                        .stroke(Color.cinematePurpleLight, lineWidth: 1)
                )
                .scaleEffect(self.circles[index]) //Applies a scaling transformation to the circle using its current scale from the circles array
                .opacity(self.opacities[index]) //Same with opacities arrray
                .frame(width: 150, height: 150) //Sets the size of each circle's frame to 150x150 points.
            
                .onAppear {
                    // Redémarre l'animation dès qu'un cercle apparaît
                    withAnimation(
                        Animation.easeOut(duration: self.duration)
                            .delay(Double(index) * 0.5) // Delai between each circle
                            .repeatForever(autoreverses: false) //Does not reverse
                    ) {
                        self.circles[index] = self.maxScale // Updates the circle’s scale to the maxScale (making it grow)
                        self.opacities[index] = 0.2 // Same but with opacity to fade out
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
    var body: some View { //fake button so just put it in historic and randomize film again
        Button(action: {
              historicList.insert (filmRandomized, at: 0)
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
            //change between add, To see, Seen
            if buttonRightTapped == "Add" {
                buttonRightTapped = "ToSee"
            } else if buttonRightTapped == "ToSee" {
                buttonRightTapped = "Seen"
            } else {
                buttonRightTapped = "Add"
            }
        }) {
            //change icon according to the value
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
    // add to historic list and randomize again
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
    // link for the criteria menu to be on/off
    @Binding var criteresModal: Bool
    var body: some View {
        HStack {
            Image(systemName: "slider.horizontal.3") // invisible critria menu icon disabled to center the "randomizer" title
                .foregroundStyle(.cinemateBlack)
                .font(.system(size: 16))
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.cinemateBlack, lineWidth: 1) // border line
                )
                .padding(.horizontal)
                .padding(.vertical, 4)
            Spacer ()
            Text("Randomizer")  // title
                .font(.staatlichesLargeTitle())
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Spacer()
            Button(action: { //Real button to open the criteria page
                criteresModal.toggle() 
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
            //show the criteria page
            .sheet(isPresented: $criteresModal) {
                FiltersView()
            }
        }
    }
}

//randomized movie and fake favorite button
struct RandomizedFilm: View {
    @State var heartTapped : Bool = false
    var filmRandomized : Film
    var body: some View {
        VStack {
            ZStack {
                //link to the description page of the movie
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
                        // fake favorite button
                        Button {
                            heartTapped.toggle()
                        } label: {
                            
                            Image(systemName: heartTapped ?  "heart.fill" : "heart" ) //change heart type when toggled
                                .foregroundColor(heartTapped ? .red : .cinemateWhite) /:same with color
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
                //show all the grenres of the film
                ForEach(filmRandomized.filmGenres, id: \.self) { genre in
                    Text("\(genre)")
                }
            }
            //Show the release date and duration of the film
            Text("\(filmRandomized.filmDate) - \(filmRandomized.filmDurationHours)")
        }
    }
}


#Preview {
    RandomizerView()
    //    TabBarView()
}
