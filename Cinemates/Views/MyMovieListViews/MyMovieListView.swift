//
//  MyMovieListView.swift
//  Cinemates
//
//  Created by apprenant98 on 30/01/2025.
//

import SwiftUI

struct MyMovieListView: View {
    
    @State var isWatchedShowing: Bool = true
    @State var searchText: String = ""
    @State var selectedCategory: String = "Vus"
    
    init() { // Pour modifier apparence du Segmented Control Picker
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.cinematePurpleLight)
            UISegmentedControl.appearance().setTitleTextAttributes([
                .foregroundColor: UIColor.cinemateWhite,
                .font: UIFont(name: "Staatliches-Regular", size: 16)!], for: .selected)
            UISegmentedControl.appearance().setTitleTextAttributes([
                .foregroundColor: UIColor.cinemateGrayLight,
                .font: UIFont(name: "Staatliches-Regular", size: 16)!], for: .normal)
    }
    
    let columns = [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)]
    
    var listShowing: [Film] {
        let filteredList  = (selectedCategory == "Vus") ? veuveNoireFilms.filmsSeen : veuveNoireFilms.filmsToSee
        if searchText.isEmpty {
            return filteredList
        } else {
            return filteredList.filter { $0.filmName.localizedCaseInsensitiveContains(searchText) }
        }
    }
    var body: some View {
        ZStack {
            Color.cinemateBlack
                .ignoresSafeArea()
            VStack {
                Text("MA LISTE")
                    .font(Font.staatlichesLargeTitle())
                    .foregroundStyle(.cinemateWhite)
                SearchBarView(searchText: $searchText)
                Picker("Catégorie", selection: $selectedCategory) {
                    Text("À voir")
                        .tag("À voir")
                    Text("Vus")
                        .tag("Vus")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .colorScheme(.dark)
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    ScrollView {
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
                }
                .padding(.horizontal, 10)
                Spacer()
            }
        }
    }
}

#Preview {
    TabBarView()
}



