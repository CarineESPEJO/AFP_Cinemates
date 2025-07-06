//
//  FilmRatingView.swift
//  Cinemates
//
//  Created by Carine ESPEJO on 30/01/2025.
//

import SwiftUI

//function rating film pageview
// As an app POC made by beginners, the teachers doesn't let us make it fonctionnable, the note is not put into the database, just return as a var of the pageview
struct FilmRatingView: View {
    var filmNoted: Film = theMatrix
    @State var scenarioRating = 5
    @State var visualRating = 5
    @State var musicRating = 5
    @State var comment = ""
    @State var commentTooLong : Bool = false
    @Binding var generalNote: Double
    
    // Calcul of the average Note
    var averageRating: Double {
        Double(scenarioRating + visualRating + musicRating) / 3.0
    }
    
    // Structuration of a reaction
    struct Reaction {
        var emote : String
        var punchline : String
    }
    
     // Reaction based on average rating
    var reaction : Reaction {
        switch averageRating {
        case 4.5...5.0: return Reaction(emote: "😍", punchline : "Banger !!!" )
        case 3.5..<4.5: return Reaction(emote:  "😊", punchline: "Incroyable" )
        case 2.5..<3.5: return Reaction(emote: "😐", punchline: "Mouais..." )
        default: return Reaction(emote: "🤮", punchline: "C nul !" )
        }
    }
    
    @Environment(\.dismiss) var dismiss // To dismiss the page
    
    var body: some View {
        VStack(spacing: 10) {
            
            HStack {
                Button {
                    dismiss() // button to dismiss the page
                    
                } label : {
                    HStack {
                    Image(systemName: "chevron.left")
                                .font(.urbanistSubHeadline())
                    Text("Retour")
                   
                }
                    .font(.urbanistHeadline())
                    .padding(.vertical)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                Spacer()
                
                // Titre
                Text("\(filmNoted.filmName)")
                    .font(.staatlichesTitle2())
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                
                HStack {
                Image(systemName: "chevron.left") // to have same space at the left and right to center film name
                            .font(.urbanistSubHeadline())
                Text("Retour")
                    
               
            }
                .font(.urbanistHeadline())
                .padding(.vertical)
                .foregroundColor(.cinematePurpleDark)
                .cornerRadius(10)
            }
            
            HStack {
                VStack(spacing: 16) {
                    // Notation
                    RatingRow(title: "Scénario", rating: $scenarioRating) //call function to rate each part
                    RatingRow(title: "Visuel", rating: $visualRating) //same
                    RatingRow(title: "Musique", rating: $musicRating)  //same
                }
                Spacer()
                VStack(spacing: 5) {
                    Text(reaction.emote)
                        .font(.system(size: 125))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("\(String(format: "%.1f", averageRating))") //show averageNote in string with only 1 number ofter the virgule
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.cinemateGrayBubble)
                        .cornerRadius(8)
                    
                    Text("\(reaction.punchline)")
                        .font(.staatlichesTitle2())
                        .foregroundColor(.white)
                        .padding(.top, 10)
                }
                .padding()

                
                Spacer()
            }
            
            Text("Maximum 500 caractères")
                .font(.urbanistSubHeadline())
                .foregroundStyle(commentTooLong ? .red : .clear ) // here at all time but if comment higher than 500 caracteres, it go from invisible to red
                .padding(.bottom, 10) 
        
            ZStack(alignment: .topLeading) {
                TextEditor(text: $comment) //zone to add a comment for the film
                    .font(.caption)
                    .background(Color.black)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(.cinemateGrayDark, lineWidth: 1))
                    .colorScheme(.dark) //change the backgound of the zone into black
                
                if comment.isEmpty { //if no comment, show this text
                    Text("Ajouter un commentaire")
                        .foregroundColor(.cinemateGrayLight)
                        .font(.urbanistSubHeadline())
                        .padding([.top, .leading], 14) // Offset to prevent placeholder text from overlapping with entered text
                }
            }
            .frame(width: .infinity, height: 150)
            .cornerRadius(8)

            Button("Valider ma note") {
                // if comment higher than 500 caracteres, show message invisible in red
                if comment.count > 500 {
                    commentTooLong = true
                // else give back the note to use on film pagevieww and dismiss rating pageview
                } else {
                    generalNote = averageRating
                    dismiss()
                }
            }
            .font(.staatlichesTitle2())
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.cinematePurpleLight)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.top, 40)
            
            Spacer()
        }
        .padding()
        .background(Color.cinematePurpleDark)

    }
    
    //function to show rating row for each parts
    struct RatingRow: View {
        let title: String
        @Binding var rating: Int
        
        var body: some View {
            VStack (alignment: .leading, spacing: 4) {
                Text(title)
                    .font(Font.urbanistHeadline())
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                HStack {
                    // it shows 5 stars and when we click on one of them, it give its index as tha value of the rating
                    ForEach(1..<6) { index in
                        Image(systemName: "star.fill" )
                            // if the index is below or egal at rating, the star is yellow
                            .foregroundColor(index <= rating ? .yellow : .gray)
                            .onTapGesture {
                                rating = index
                            }
                    }
                }
                .padding()
                .background {
                    Capsule(style: .circular)
                        .strokeBorder(Color.cinemateWhite.opacity(0.6), lineWidth: 1)
                        .background(Capsule().fill(.cinematePurpleDark).opacity(0.0))
                }
            }
        }
    }
}

struct FilmRatingView_Previews: PreviewProvider {
    @State static var generalNote: Double = 4.0
    
    static var previews: some View {
        FilmRatingView(filmNoted: theShawshankRedemption, generalNote: $generalNote)
    }
}
