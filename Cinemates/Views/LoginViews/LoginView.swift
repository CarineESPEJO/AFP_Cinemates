import SwiftUI

struct LoginView: View {
    
    // @state pour rafraichir page quand modif
    
    // Récupérer la catégorie de taille d'accessibilité (gros texte, texte normal, etc.) pour la taille du logo et le scrollview
    @Environment(\.sizeCategory) var sizeCategory
    
    // Erreur si mauvais email ou mot de passe (l.87)
    private var textWrong: String {
        if wrongEmail {
            return "Mauvais email"
        } else if wrongPassword {
            return "Mauvais mot de passe"
        } else {
            return " "
        }
    }
    
    
    // var pour le login
    @State private var email: String = "" // écriture du mail par l'utilisateur
    @State private var password: String = "" // écriture du mdp par l'utilisateur
    @State private var wrongEmail: Bool = false // var pour vérifier si bon mail
    @State private var wrongPassword: Bool = false // var pour vérifier si bon mdp
    @Binding var showingLoginScreen: Bool // var pour passer à page suivante
    @State private var username: String = "" // affichage du pseudo relié au compte
    
    var body: some View {
        ZStack {
            Image(.bgLogin)
                .resizable(resizingMode: .stretch) // pour que tout fonctionne
                .aspectRatio(contentMode: .fill) // pour que ça soit partout
                .ignoresSafeArea()
            VStack {
                Spacer() // Espacement pour éviter que le logo touche le haut
                
                VStack { // Pour grouper la partie titre (logo, titre, catch phrase)
                    Spacer()
                    
                    Image(.logo)
                        .resizable() // permet de changer taille de l'image
                        .scaledToFill() // Approche de remplissage tout en maintenant l'aspect
                        .frame(width: getLogoSize(), height: getLogoSize()) // va chercher func logo (l.204)
                        .clipped() // Assure que l'image ne dépasse pas du cadre
                        .cornerRadius(8.0)
                        .shadow(color: .cinematePurpleMid, radius: 20, x: 0, y: 0)
                    
                    Text("Cinémates")
                        .font(Font.TeachersLargeTitle()) // utilise une font personnalisé (cf : FontExtensions.swift)
                        .fontWeight(.medium)
                    
                    Text("A la recherche du film parfait.") // catch phrase
                        .font(Font.urbanistHeadline()) // utilise une font personnalisé (cf : FontExtensions.swift)
                        .fontWeight(.regular)
                    
                } // fin de la partie groupée titre
                .foregroundColor(Color.white) // Titre & catch phrases sont blancs
                .multilineTextAlignment(.center) // Si texte grossit et doit revenir à la ligne : reste centré
                .padding(.vertical, 32)
                
                Spacer () // Espacement avant le formulaire
                
                VStack (spacing : 12){
                    VStack {
                        Text("Connexion")
                            .font(Font.staatlichesTitle2()) // utilise une autre font personnalisé (cf : FontExtensions.swift)
                            .foregroundColor(Color.white)
                            .frame( height: 25.0)
                        
                        // Erreur si mauvais email ou mot de passe (l.10)
                        Text(textWrong)
                            .font(.urbanistHeadline())
                            .foregroundColor(Color.red)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack (spacing : 16) {
                        Group { // regroupe les inputsViews
                            LogInputView(logInput: $email, wrongLogInput: $wrongEmail,
                                         logLabel: "Email" , logSymbol: "envelope", logInputName : "Email" )
                            
                            
                            LogInputView(logInput: $password, wrongLogInput: $wrongPassword, logLabel: "password" , logSymbol: "lock"  , logInputName : "Mot de passe" )
                        }
                        
                        
                        Button("Mot de passe oublié ?") {
                            
                        }
                        .foregroundColor(.white)
                        
                        Button {
                            authenticateUser(email: email, password: password)

                        } label: {
                            HStack {
                                Spacer()
                                Text("Se connecter")
                                    .font(.staatlichesHeadline())
                                Spacer()
                            }
                        }
                        .frame(height: 52.0)
                        .foregroundColor(.white)
                        .background(Color.cinematePurpleLight)
                        .cornerRadius(8.0)
                        
                        
                        HStack {
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
                        
                        HStack {
                            Button {
                                username = "VeuveNoire"
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
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8.0) // Utilise le même rayon de coin que pour le fond
                                        .stroke(.cinemateGrayDark, lineWidth: 1) // Bordure colorée et arrondie
                                )
                                .padding(.trailing, 8)
                            }
                            
                            Button {
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
                                    RoundedRectangle(cornerRadius: 8.0) // Utilise le même rayon de coin que pour le fond
                                        .stroke(.cinemateGrayDark, lineWidth: 1) // Bordure colorée et arrondie
                                )
                                .padding(.trailing, 8)
                            }
                        }
                        
                        
                        Button("Créer un compte") {
                            
                        }
                        .padding(.vertical)
                    }
                    
                }
                .font(Font.urbanistSubHeadline())
                .padding(.vertical)
                
            } // Fin du VStack comprenand tout sauf BG
            .foregroundColor(.cinemateWhite) // presque tout les textes sont en blanc
            .fontWeight(.regular) // presque tout les textes sont en regular
            .padding(.horizontal) // pour que tout les éléments (sauf le BG) ne touche pas les côtés
            .padding(.bottom, 20) // Ajouter un peu d'espace en bas pour éviter que le contenu touche le bord
            .frame(maxHeight: .infinity) // Permet de ne pas faire déborder le contenu à l'écran
        }
    }
        
        func getLogoSize() -> CGFloat {
            let baseSize: CGFloat = 66 // Taille par défaut pour le logo
            switch sizeCategory {
            case .extraSmall ,.small:
                return baseSize * 0.75
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
        
        func authenticateUser(email: String, password: String) {
            if email.lowercased() == "admin@example.com" {
                wrongEmail = false
                if password == "123abc" {
                    wrongPassword = false
                    username = "VeuveNoire"
                    showingLoginScreen = false
                } else {
                    wrongPassword = true
                }
            } else {
                wrongEmail = true
            }
        }
}

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
                    RoundedRectangle(cornerRadius: 8.0) // Utilise le même rayon de coin que pour le fond
                        .stroke(.cinemateGrayDark, lineWidth: 1) // Bordure colorée et arrondie
                )
                .padding(.trailing, 8)
            }}
    }





#Preview {
    LoginView(showingLoginScreen: .constant(true))
}
