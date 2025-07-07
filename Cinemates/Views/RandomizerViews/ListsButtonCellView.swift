//
//  ListsButtonCellView.swift
//  Cinemates
//
//  Created by apprenant98 on 02/02/2025.
//


import SwiftUI

//function to create the lists buttons
struct ListsButtonCellView: View {
    // take film list to change it
    @Binding var randomizerTotalList : [Film]
    //to know if button is activated
    @Binding var listButton: Bool
    //Same but for the other 2 buttons
    @Binding var otherListButtonOne : Bool
    @Binding var otherListButtonTwo : Bool
    var buttonName: String
    // the lists the button is linked too
    var buttonAction : [Film]
     //Same but for the other 2 buttons
    var otherButtonOneAction : [Film]
    var otherButtonTwoAction : [Film]
    // the total button list
    var TotalButtonAction : [Film] = filmsDatabase
    var body: some View {
        Button(buttonName) {
            // if this button is not activated and the other 2 neither
            if listButton == false {
                if otherListButtonOne == false && otherListButtonTwo == false {
                    // it removed the list of the total button
                    //(because if neither o the 3 buttons are activated, its the total which is activated)
                    randomizerTotalList.removeAll()
                }
                //else it add the films of this list button to randomizer where there is already the ones of the other activated buttons
                randomizerTotalList.append(contentsOf: buttonAction)
                // the button is activated
                listButton = true
            } else {
                // if it is pushed to be desactivated
                // we clean the randomize list to put it in again the lists of the other buttons still active
                randomizerTotalList.removeAll()
                if otherListButtonOne == true {
                    randomizerTotalList.append(contentsOf: otherButtonOneAction)
                    if otherListButtonTwo == true {
                        randomizerTotalList.append(contentsOf: otherButtonTwoAction)
                    }
                } else if otherListButtonTwo == true {
                    randomizerTotalList.append(contentsOf: otherButtonTwoAction)
                // if none of the 3 are activated, total button activated so we put its list in randomizedlist
                // dont need a var to activate/desactivate the button because its passif from the others (list added and aspect)
                }else {
                    randomizerTotalList.append(contentsOf: filmsDatabase)
                }
                //the button is disactivated
                listButton = false
                
            }
            
        }
        .foregroundStyle(listButton.self == false ? Color.cinemateGrayLight : Color.cinemateWhite)
        .font(.urbanistHeadline())
        .padding(.horizontal, 12)  
        .padding(.vertical, 4)
        .background(listButton.self == false ? Color.clear : Color.cinematePurpleLight)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20) 
                .stroke(Color.cinemateGrayDark, lineWidth: 1)
        )
    }
}
