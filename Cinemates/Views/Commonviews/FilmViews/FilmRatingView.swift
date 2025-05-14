import SwiftUI

struct FilmRatingView: View {
    var filmNoted: Film = theMatrix
    @State var scenarioRating = 5
    @State var visualRating = 5
    @State var musicRating = 5
    @State var comment = ""
    @State var commentTooLong : Bool = false
    @Binding var generalNote: Double
    
    // Calcul de la note moyenne
    var averageRating: Double {
        Double(scenarioRating + visualRating + musicRating) / 3.0
    }
    
    // Réactions en fonction de la note moyenne
    struct Reaction {
        var emote : String
        var punchline : String
    }
    
    var reaction : Reaction {
        switch averageRating {
        case 4.5...5.0: return Reaction(emote: "😍", punchline : "Banger !!!" )
        case 3.5..<4.5: return Reaction(emote:  "😊", punchline: "Incroyable" )
        case 2.5..<3.5: return Reaction(emote: "😐", punchline: "Mouais..." )
        default: return Reaction(emote: "🤮", punchline: "C nul !" )
        }
    }
    
    @Environment(\.dismiss) var dismiss // Ajout de dismiss pour fermer la feuille
    
    var body: some View {
        VStack(spacing: 10) {
            
            HStack {
                Button {
                    dismiss()
                    
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
                Image(systemName: "chevron.left")
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
                    RatingRow(title: "Scénario", rating: $scenarioRating)
                    RatingRow(title: "Visuel", rating: $visualRating)
                    RatingRow(title: "Musique", rating: $musicRating)
                }
                Spacer()
                VStack(spacing: 5) {
                    Text(reaction.emote)
                        .font(.system(size: 125))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("\(String(format: "%.1f", averageRating))")
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
                .foregroundStyle(commentTooLong ? .red : .clear )
                .padding(.bottom, 10) // Réduit l'espace sous cette ligne
        
            ZStack(alignment: .topLeading) {
                TextEditor(text: $comment)
                    .font(.caption)
                    .background(Color.black)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(.cinemateGrayDark, lineWidth: 1))
                    .colorScheme(.dark)
                
                if comment.isEmpty {
                    Text("Ajouter un commentaire")
                        .foregroundColor(.cinemateGrayLight)
                        .font(.urbanistSubHeadline())
                        .padding([.top, .leading], 14) // Décalage pour éviter que le texte de placeholder ne se superpose avec le texte entré
                }
            }
            .frame(width: .infinity, height: 150)
            .cornerRadius(8)

            // Bouton Valider
            Button("Valider ma note") {
                if comment.count > 500 {
                    commentTooLong = true
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
    
    //ligne de notation
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
                    ForEach(1..<6) { index in
                        Image(systemName: "star.fill" )
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
