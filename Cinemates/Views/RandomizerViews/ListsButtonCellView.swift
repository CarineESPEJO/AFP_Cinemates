//
//  ListsButtonCellView.swift
//  Cinemates
//
//  Created by apprenant98 on 02/02/2025.
//


import SwiftUI

struct ListsButtonCellView: View {
    @Binding var randomizerTotalList : [Film]
    @Binding var listButton: Bool
    @Binding var otherListButtonOne : Bool
    @Binding var otherListButtonTwo : Bool
    var buttonName: String
    var buttonAction : [Film]
    var otherButtonOneAction : [Film]
    var otherButtonTwoAction : [Film]
    var TotalButtonAction : [Film] = filmsDatabase
    var body: some View {
        Button(buttonName) {
            if listButton == false {
                if otherListButtonOne == false && otherListButtonTwo == false {
                    randomizerTotalList.removeAll()
                }
                randomizerTotalList.append(contentsOf: buttonAction)
                listButton = true
            } else {
                randomizerTotalList.removeAll()
                if otherListButtonOne == true {
                    randomizerTotalList.append(contentsOf: otherButtonOneAction)
                    if otherListButtonTwo == true {
                        randomizerTotalList.append(contentsOf: otherButtonTwoAction)
                    }
                } else if otherListButtonTwo == true {
                    randomizerTotalList.append(contentsOf: otherButtonTwoAction)
                }else {
                    randomizerTotalList.append(contentsOf: filmsDatabase)
                }
                listButton = false
                
            }
            
        }
        .foregroundStyle(listButton.self == false ? Color.cinemateGrayLight : Color.cinemateWhite)
        .font(.urbanistHeadline())
        .padding(.horizontal, 12)   // Ajoute un padding horizontal de 4 (gauche et droite)
        .padding(.vertical, 4)
        .background(listButton.self == false ? Color.clear : Color.cinematePurpleLight)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20) // Ici, tu définis le rayon des coins
                .stroke(Color.cinemateGrayDark, lineWidth: 1) // Bordure blanche de 4 points de large
        )
    }
}
