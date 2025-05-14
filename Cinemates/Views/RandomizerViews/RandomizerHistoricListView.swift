//
//  RandomizerHistoricListView.swift
//  Cinemates
//
//  Created by apprenant98 on 04/02/2025.
//

import SwiftUI

struct RandomizerHistoricListView: View {
    
    let columns = [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)]
    var listShowing: [Film]
    
    @Environment(\.dismiss) var dismiss // Ajout de dismiss pour fermer la feuille
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Button {
                    dismiss()
                    
                } label : {
                    HStack {
                        Image (systemName: "chevron.left")
                            .font(.urbanistSubHeadline())
                        Text("Retour")
                        
                    }
                    .font(.urbanistHeadline())
                    .padding(.vertical)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                Spacer ()
                
                // Titre
                Text("Historique du Randomizer")
                    .font(.staatlichesTitle2())
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer ()
                
                HStack {
                    Image (systemName: "chevron.left")
                        .font(.urbanistSubHeadline())
                    Text("Retour")
                    
                }.foregroundStyle(.cinematePurpleDark)
            }
            .padding(.horizontal, 10)
            
            ScrollView {
                VStack {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(listShowing) { film in
                        NavigationLink {
                            FilmPageView(FilmP: film)
                        } label: {
                            FilmCellView(filmShowed: film)
                        }
                    }
                }
            }
                .padding(.horizontal, 10)
                .padding(.vertical, 20)
                .background(Color.cinemateBlack)
                
                
        }
    }
        
        .background(Color.cinematePurpleDark)
}
}

#Preview {
    RandomizerHistoricListView(listShowing: filmsDatabase)
}
