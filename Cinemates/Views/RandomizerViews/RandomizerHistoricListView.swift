//
//  RandomizerHistoricListView.swift
//  Cinemates
//
//  Created by apprenant98 on 04/02/2025.
//

import SwiftUI

// View for film historic list
struct RandomizerHistoricListView: View {

    // to define the layout of columns of a 2-column vertical grid (.flexible = take all the space it can)
    let columns = [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)]
    
    var listShowing: [Film]
    
    @Environment(\.dismiss) var dismiss // to close the pageView
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                // button to close the pageView
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
                
                Text("Historique du Randomizer")
                    .font(.staatlichesTitle2())
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer ()

                //to center the title by adding same button but fake and invisible
                HStack {
                    Image (systemName: "chevron.left")
                        .font(.urbanistSubHeadline())
                    Text("Retour")
                    
                }.foregroundStyle(.cinematePurpleDark)
            }
            .padding(.horizontal, 10)

            //Scroll view to see all the films of the list
            ScrollView {
                VStack {
                //Creates a 2-column vertical grid 
                LazyVGrid(columns: columns, spacing: 16) {
                    //Each movie of the list appear in the FilmCellView format into the grid
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
