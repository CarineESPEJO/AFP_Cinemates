//
//  SearchListView.swift
//  Cinemates
//
//  Created by apprenant98 on 30/01/2025.
//

import SwiftUI

struct SearchListView: View {
    @State private var searchText: String = ""
   
    @State private var films: [Film] = filmsDatabase

    var body: some View {
            ZStack {
                Color("cinemateBlack").edgesIgnoringSafeArea(.all)

                VStack {
                    Text("RECHERCHE")
                        .font(.staatlichesLargeTitle())
                        .foregroundColor(.white)
                    Spacer()
                    SearchBarView(searchText: $searchText)

                    ScrollView {
                        Spacer()
                        VStack(spacing: 12) {
                            let filteredFilms = films.filter {
                                searchText.isEmpty || $0.filmName.localizedCaseInsensitiveContains(searchText)
                            }
                           
                            ForEach(filteredFilms, id: \.id) { film in
                                NavigationLink {
                                    FilmPageView(FilmP: film)
                                } label: {
                                MovieRowView(film: film)

                                    if film.id != filteredFilms.last?.id {
                                       
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                }
                
            }
           
    }
}





#Preview {
    SearchListView()
}
