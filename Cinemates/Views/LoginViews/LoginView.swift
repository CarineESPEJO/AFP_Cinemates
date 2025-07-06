//
//  LoginView.swift
//  Cinemates
//
//  Created by Carine ESPEJO on 30/01/2025.
//

import SwiftUI

struct LoginView: View {
    // Here I tried to do a responsive login page
    //  This line help to recover the categories of accessibility sizes to create a responsive size for the logo and the scrollview
    @Environment(\.sizeCategory) var sizeCategory
    
    // Here we check if the user inputs are wrong and which to give a personnalized errror text
    // (being a POC app, the good responses are just variables on this page and are not linked to the database)
    private var textWrong: String {
        // if var textWrong is true then we return this message
        if wrongEmail {
            return "Mauvais email"
        } else if wrongPassword {
            return "Mauvais mot de passe"
        } else {
            return " "
        }
    }
    
    
    // Here the variables for the login page
    @State private var email: String = "" // input of the mail by the user
    @State private var password: String = "" // éinput of the password by the user
    
    @State private var wrongEmail: Bool = false // variable to check if it's the wrong email to use for error text
    @State private var wrongPassword: Bool = false // variable to check if it's the wrong password to use for error text
    @Binding var showingLoginScreen: Bool // variable to show or disable the login screen and go to the next page
    @State private var username: String = "" // give the pseudo of the account (false for POC, not linked to database)

    
    var body: some View {
        ZStack { // To have the background image behind everything
            Image(.bgLogin)
                .resizable(resizingMode: .stretch) // To have the background image to work
                .aspectRatio(contentMode: .fill) // To have the background image  everywhere
                .ignoresSafeArea() // To have the background image without margin
            
            VStack { // the rest of the page
                Spacer() // Space to avoid that the logo is all the way at the top
                
                VStack { // To grous the title parts (logo, title, catch phrase)
                    Spacer() // To centrer the elements
                    
                    Image(.logo)
                        .resizable() // To resize the image
                        .scaledToFill() // Way to fill while maintaining the aspect
                        .frame(width: getLogoSize(), height: getLogoSize()) // Go searching the function to resize logo according to the accessibility sizes
                        .clipped() // Ensures the image does not extend beyond the frame
                        .cornerRadius(8.0) //rounded corners
                        .shadow(color: .cinematePurpleMid, radius: 20, x: 0, y: 0) // shadow of 20px placed at the center of the element it's linked
                    
                    Text("Cinémates") // app name
                        .font(Font.TeachersLargeTitle()) // use a personnalised font  (cf : FontExtensions.swift)
                        .fontWeight(.medium)
                    
                    Text("A la recherche du film parfait.") // app catch phrase
                        .font(Font.urbanistHeadline()) // use a personnalised fon (cf : FontExtensions.swift)
                        .fontWeight(.regular)
                    
                } // End of the grouped title part
                .foregroundColor(Color.white) // Title and catch phrase are whites(instead of same line on each, only one their parent group)
                .multilineTextAlignment(.center) // If the text is enlarged and et returns to the line, it still remains centered
                .padding(.vertical, 32) 
                
                Spacer () //Space before the form
                
                VStack (spacing : 12){  // login form, with a space of 12px between each children
                    VStack {  //Group the login title and the error message to have a more clean placement
                        Text("Connexion")
                            .font(Font.staatlichesTitle2()) // use an another personnalized font (cf : FontExtensions.swift)
                            .foregroundColor(Color.white)
                            .frame( height: 25.0) // Give a specific size to the frame of the text
                        
                        // Show the error message
                        Text(textWrong)
                            .font(.urbanistHeadline())
                            .foregroundColor(Color.red)
                            .multilineTextAlignment(.center) // If the message is more tha n one line(ex if changement in accessibility size), the text aligns in the middle
                    }
                    
                    VStack (spacing : 16) { // group the inputsViews et the login button
                        Group { // group the inputsViews of email et password
                            LogInputView(logInput: $email, wrongLogInput: $wrongEmail,
                                         logLabel: "Email" , logSymbol: "envelope", logInputName : "Email" ) // call the functione in LogInputView.swift
                            
                            
                            LogInputView(logInput: $password, wrongLogInput: $wrongPassword, logLabel: "password" , logSymbol: "lock"  , logInputName : "Mot de passe" ) // same but with differents variables as inputs
                        }
                        
                        
                        Button("Mot de passe oublié ?") { //fake bouton 
                            
                        }
                        .foregroundColor(.white)
                        
                        Button {
                            authenticateUser(email: email, password: password) // call the function authenticateUser to verify if email et password are wrights

                        } label: {
                            HStack {
                                Spacer() // To put the text at the middle
                                Text("Se connecter")
                                    .font(.staatlichesHeadline())
                                Spacer()
                            }
                        }
                        .frame(height: 52.0)
                        .foregroundColor(.white)
                        .background(Color.cinematePurpleLight)
                        .cornerRadius(8.0)
                        
                        
                        HStack { // separator between normal login and by an exterior element (as Google login)
                            Rectangle()
                                .foregroundColor(.cinemateWhite)
                                .frame(height: 1)
                            
                            Text("ou")
                                .font(.urbanistHeadline())
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Rectangle()
                                .foregroundColor(Color.white)
                                .frame(height: 1.0)
                        }
                        .padding()
                        
                        HStack { // group the 2 exterior login elements
                             // As fake buttons, they are used to log in a fast way for presentations without going through the text of the mail and password
                            Button { // Give directly the username and desactivate the showing of the login page
                                showingLoginScreen = false
                            } label: {
                                HStack {
                                    Spacer()
                                    Image ("googleLogo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24.0, height: 24.0)
                                        .cornerRadius(8.0)
                                    Text("Google")
                                        .font(.urbanistHeadline())
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.white)
                                        .multilineTextAlignment(.center)
                                    Spacer ()
                                    
                                }
                                .frame(height: 48.0)
                                .foregroundColor(.white)
                                .background(Color.cinematePurpleDark)
                                .cornerRadius(8.0)
                                .overlay(  //To create a border by using a invisible rectangle put in front of button
                                    RoundedRectangle(cornerRadius: 8.0) // 
                                        .stroke(.cinemateGrayDark, lineWidth: 1) //  To create a colored and rounded border
                                )
                                .padding(.trailing, 8) 
                            }
                            
                            Button { // same for this button
                                username = "VeuveNoire"
                                showingLoginScreen = false
                            } label: {
                                HStack {
                                    Spacer()
                                    Image (systemName : "apple.logo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24.0, height: 24.0)
                                        .cornerRadius(8.0)
                                    Text("Apple")
                                        .font(.urbanistHeadline())
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.white)
                                        .multilineTextAlignment(.center)
                                    Spacer ()
                                    
                                }
                                .frame(height: 48.0)
                                .foregroundColor(.white)
                                .background(Color.cinematePurpleDark)
                                .cornerRadius(8.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8.0) 
                                        .stroke(.cinemateGrayDark, lineWidth: 1) 
                                )
                                .padding(.trailing, 8)
                            }
                        }
                        
                        
                        Button("Créer un compte") { // also a fake button
                            
                        }
                        .padding(.vertical)
                    }
                    
                }
                .font(Font.urbanistSubHeadline())
                .padding(.vertical)
                
            } // End of the VStack containing everything but the background image
            .foregroundColor(.cinemateWhite) // almost all texts are in white
            .fontWeight(.regular) // almost all texts are in white regular
            .padding(.horizontal) /// almost all elements (but the background) don't touch the sides
            .padding(.bottom, 20) // Add some space at the bottom to prevent content from touching the edges
            .frame(maxHeight: .infinity) // Allows the content not to overflow on the screen
        }
    }
        
        func getLogoSize() -> CGFloat { // function which, depending on the accessibility size chosen, enlarges or shrinks the logo
            let baseSize: CGFloat = 66 // default size of the logo
            switch sizeCategory {
            case .extraSmall ,.small: //accessibility sizes
                return baseSize * 0.75 //default size of the logo enlarged or shrinked by multiplication
            case .medium, .large, .extraLarge :
                return baseSize * 1.0
            case .extraExtraLarge, .extraExtraExtraLarge:
                return baseSize * 1.25
            case .accessibilityMedium, .accessibilityLarge :
                return baseSize * 1.5
            case .accessibilityExtraLarge, .accessibilityExtraExtraLarge, .accessibilityExtraExtraExtraLarge :
                return baseSize * 1.75
            default:
                return baseSize
            }
        }

        // function to  vérify if the email and password are wright or wrong
        func authenticateUser(email: String, password: String) { 
            //if the 2 are both equivalents then it give the username and disable the login page to go to the next page
            if email.lowercased() == "admin@example.com" {
                wrongEmail = false
                if password == "123abc" {
                    wrongPassword = false
                    username = "VeuveNoire"
                    showingLoginScreen = false
                // if not, it change this variables to be  to be sent to LogInputView.swift which will adapt textWrong to circumstances (email have priority on textrong)
                } else {
                    wrongPassword = true
                }
            } else {
                wrongEmail = true
            }
        }
}

    // part abandoned due to lack of time, was to avoid duplicates on the exterior element buttons
    struct LogExteriorView: View {
        @Binding var username : String
        @Binding var showingLoginScreen : Bool
        var logExteriorLabel : String
        var logInputName : String
        var logImage : ImageResource
        
        var body : some View {
            Button {
                username = "VeuveNoire"
                showingLoginScreen = false
                print("apple fonctionne")
            } label: {
                HStack {
                    Spacer()
                    Image (logImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24.0, height: 24.0)
                        .cornerRadius(8.0)
                    Text("Apple")
                        .font(.urbanistHeadline())
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    Spacer ()
                    
                }
                .frame(width: .infinity, height: 48.0)
                .foregroundColor(.white)
                .background(Color.cinematePurpleDark)
                .cornerRadius(8.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 8.0) 
                        .stroke(.cinemateGrayDark, lineWidth: 1) 
                )
                .padding(.trailing, 8)
            }}
    }





#Preview {
    LoginView(showingLoginScreen: .constant(true))
}
