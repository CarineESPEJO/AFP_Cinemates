//
//  LogInputView.swift
//  App_test
//
//  Created by apprenant98 on 30/01/2025.
//


import SwiftUI

struct LogInputView: View {
    @Binding var logInput : String
    @Binding var wrongLogInput : Bool
    var logLabel : String
    var logSymbol : String
    var logInputName : String
    
    
    
    var body : some View {
        HStack {
            Image(systemName: logSymbol)
                .foregroundColor(Color.gray)
                .imageScale(.large)
                .padding(.leading)
            
            ZStack(alignment: .leading) {
                if logInput.isEmpty {
                    Text(logInputName)
                        .foregroundColor(.gray)
                        .font(.urbanistSubHeadline())
                }
                if logLabel.lowercased().contains ("password") {
                    SecureField("", text: $logInput )
                        .foregroundColor(.white)
                } else {
                    TextField("", text: $logInput )
                        .foregroundColor(.white)
                }
                
                
        }
    }
    .frame(height: 48.0)
    .background(Color.cinematePurpleDark)
    .cornerRadius(8.0)
    // border n'arrondissait pas ses angles donc autr moyen
    .overlay(
        RoundedRectangle(cornerRadius: 8.0) // Utilise le même rayon de coin que pour le fond
            .stroke( wrongLogInput ? Color.red : Color.cinemateGrayDark, lineWidth: 1) // Bordure colorée et arrondie
    )
    .foregroundColor(Color.cinemateGrayLight)
    .imageScale(.large)
    }
    
}

//#Preview {
//    LogInputView(logInput: <#Binding<String>#>, wrongLogInput: <#Binding<Bool>#>, logLabel: Email, logSymbol: "envelope", logInputName: Email)
//}

