//
//  ToggleNotationFilmView.swift
//  Cinemates
//
//  Created by apprenant91 on 05/02/2025.
// Parts added by Carine ESPEJO from line 50 to line 82
//


import SwiftUI

struct ToggleNotationFilmView: View {
    var FilmP: Film
    @State  var showChoices = false
    var ButtonStyle = FilmButtonStyle()
    @State  var userFilms = veuveNoireFilms
    @State  var ownNoteNotClicked = true
    @State  var ownNote: Double = 0.0
    @State  var ratingModal: Bool = false
    @State  var filmStatus: String
    @State  var isFavorite: Bool = false
    
    
    init(FilmP: Film) {
        self.FilmP = FilmP
        let initialFilmStatus = ToggleNotationFilmView.getInitialFilmStatus(for: FilmP)
        let initialFavoriteStatus = veuveNoireFilms.filmsFavorites.contains(where: { $0.filmName == FilmP.filmName })
        
        _filmStatus = State(initialValue: initialFilmStatus)
        _isFavorite = State(initialValue: initialFavoriteStatus)
    }
    var body: some View {
        HStack {
                        Button {
                toggleFilmStatus()
            } label: {
                HStack {
                    Image(systemName: iconForStatus())
                    Text(labelForStatus())
                        .font(.urbanistHeadline())
                }
            }
            .padding()
            .frame(maxWidth: 110, maxHeight: 40)
            .background(Capsule().fill(Color.cinemateGrayBubble).opacity(0.4))
            .overlay(Capsule().strokeBorder(Color.cinemateGrayDark.opacity(0.6), lineWidth: 2))
            .foregroundColor(.cinemateWhite)
            //                            .padding(.horizontal, 7)
            
            // Here it verify if there is already a note, if not, it shows a button "Noter"
            //it puts the rating page in front of the page description view
            if ownNoteNotClicked {
                Button("Noter") {
                    ownNoteNotClicked = false
                    ratingModal.toggle() // Ativate/desactivate the showing of the rating page
                }
                .padding()
                .frame(maxWidth: 100, maxHeight: 40)
                .font(.urbanistHeadline())
                .background(Capsule().fill(Color.cinemateGrayBubble).opacity(0.4))
                .overlay(Capsule().strokeBorder(Color.cinemateGrayDark.opacity(0.6), lineWidth: 2))
                .foregroundColor(.cinemateWhite)
                .sheet(isPresented: $ratingModal) {
                    FilmRatingView(filmNoted: FilmP, generalNote: $ownNote) 
                }
                
            } else {
                Button("\(String(format: "%.1f", ownNote))") {
                    ratingModal.toggle() // Déclenche l'ouverture de la feuille
                }
                .padding()
                .frame(maxWidth: 80, maxHeight: 40)
                .background(Capsule().fill(Color.cinemateGrayBubble).opacity(0.4))
                .overlay(Capsule().strokeBorder(Color.cinemateGrayDark.opacity(0.6), lineWidth: 2))
                .foregroundColor(.cinemateWhite)
                //show the rating page by toggling with isPresented
                .sheet(isPresented: $ratingModal) {
                    FilmRatingView(filmNoted: FilmP, generalNote: $ownNote)
                }
            }
            
            Button {
                toggleFavorite()
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .white)
                    .font(.system(size: 20))
            }
            .padding(.horizontal,1)
            .frame(maxWidth: 50, maxHeight: 40)
            .background(Capsule().fill(Color.cinemateGrayBubble).opacity(0.4))
            .overlay(Capsule().strokeBorder(Color.cinemateGrayDark.opacity(0.6), lineWidth: 2))
            
            
            Spacer()
        }
    }
    func toggleFilmStatus() {
       switch filmStatus {
       case "none":
           filmStatus = "toSee"
           userFilms.filmsToSee.append(FilmP)
           
       case "toSee":
           filmStatus = "seen"
           userFilms.filmsToSee.removeAll { $0.filmName == FilmP.filmName }
           userFilms.filmsSeen.append(FilmP)
           
       case "seen":
           filmStatus = "none"
           userFilms.filmsSeen.removeAll { $0.filmName == FilmP.filmName }
           
       default:
           break
       }
   }
   
   // ✅ Fonction pour récupérer l'état initial du film
   static func getInitialFilmStatus(for film: Film) -> String {
       if veuveNoireFilms.filmsSeen.contains(where: { $0.filmName == film.filmName }) {
           return "seen"
       } else if veuveNoireFilms.filmsToSee.contains(where: { $0.filmName == film.filmName }) {
           return "toSee"
       } else {
           return "none"
       }
   }
   
   // ✅ Fonction pour obtenir l'icône du bouton
   func iconForStatus() -> String {
       switch filmStatus {
       case "none": return "plus"
       case "toSee": return "eye.fill"
       case "seen": return "checkmark"
       default: return "plus"
       }
   }
   
   // ✅ Fonction pour obtenir le texte du bouton
  func labelForStatus() -> String {
       switch filmStatus {
       case "none": return "Ajouter"
       case "toSee": return "À voir"
       case "seen": return "Vu"
       default: return "Ajouter"
       }
   }
   
   func toggleFavorite() {
       if isFavorite {
           veuveNoireFilms.filmsFavorites.removeAll { $0.filmName == FilmP.filmName }
       } else {
           veuveNoireFilms.filmsFavorites.append(FilmP)
       }
       isFavorite.toggle()
   }
}
#Preview {
    ToggleNotationFilmView(FilmP: theBatman)
}
