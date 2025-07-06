//
//  LogInputView.swift
//  App_test
//
//  Created by Carine ESPEJO on 30/01/2025.
//


import SwiftUI

//function to let user input their email o r password
struct LogInputView: View {
    //As its work for email and password, it needs element for front an back
    @Binding var logInput : String
    @Binding var wrongLogInput : Bool
    var logLabel : String
    var logSymbol : String
    var logInputName : String
    
    
    
    var body : some View {
        HStack { //input zone
            Image(systemName: logSymbol) 
                .foregroundColor(Color.gray)
                .imageScale(.large)
                .padding(.leading)
            
            ZStack(alignment: .leading) { 
                if logInput.isEmpty { //if input is empty, put a text instead as "Email" or "password"
                    Text(logInputName)
                        .foregroundColor(.gray)
                        .font(.urbanistSubHeadline())
                }
                if logLabel.lowercased().contains ("password") { //if email, it's text field else its secyrefield and show dots
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
    .overlay(
        RoundedRectangle(cornerRadius: 8.0)
            .stroke( wrongLogInput ? Color.red : Color.cinemateGrayDark, lineWidth: 1) // border line change color to red if input is wrong
    )
    .foregroundColor(Color.cinemateGrayLight)
    .imageScale(.large)
    }
    
}

//#Preview {
//    LogInputView(logInput: <#Binding<String>#>, wrongLogInput: <#Binding<Bool>#>, logLabel: Email, logSymbol: "envelope", logInputName: Email)
//}

