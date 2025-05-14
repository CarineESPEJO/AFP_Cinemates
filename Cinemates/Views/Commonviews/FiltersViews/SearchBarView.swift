//
//  SearchBarView.swift
//  Cinemates
//
//  Created by apprenant80 on 04/02/2025.
//


import SwiftUI

struct SearchBarView: View {
    @State var criteresModal: Bool = false
    @Binding var searchText: String

    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: 320, height: 48)
                    .foregroundStyle(.cinematePurpleDark)
                    .overlay(Rectangle()
                        .stroke(Color.cinemateGrayBubble, lineWidth: 2))
                    .cornerRadius(10)
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    ZStack(alignment: .leading) {
                        if searchText.isEmpty {
                            Text(" Rechercher un film...")
                                .font(Font.custom("Urbanist-Regular", size: 16, relativeTo: .body))
                                .opacity(0.7)
                        }
                        TextField("", text: $searchText)
                    }
                }
                .foregroundStyle(.cinemateGrayLight)
                .padding(.leading, 12)
            }
            
            Button(action: {
                criteresModal.toggle() // Déclenche l'ouverture de la feuille
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 48, height: 48)
                        .cornerRadius(8)
                        .foregroundStyle(.cinematePurpleDark)
                        .overlay(Rectangle()
                            .stroke(Color.cinemateGrayBubble, lineWidth: 2))
                        .cornerRadius(8)
                    Image(systemName: "slider.horizontal.3")
                        .foregroundStyle(.cinemateGrayLight)
                }
            }
            .sheet(isPresented: $criteresModal) {
                // Spécifiez la vue que vous voulez afficher dans la feuille
                FiltersView()
            }
        }
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
