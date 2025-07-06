//
//  LogInputView.swift
//  Cinemates
//
//  Created by Carine ESPEJO on 30/01/2025.
//

import SwiftUI

struct LoginView: View {
    // Ici j'ai essayé de rendre le login responsive.
    //  Cette ligne permet de récupérer la catégorie de taille d'accessibilité (gros texte, texte normal, etc.) pour la taille du logo et le scrollview
    @Environment(\.sizeCategory) var sizeCategory
    
    // Ici on vérifie si l'utilisateur entre un mauvais email ou mot de passe et si oui on lui retourne un message personnalisé
    // (étant un POF, ce nes sont que des variables sur cette page et non relié à la database)
    private var textWrong: String {
        // si var textWrong est true alors on retourne le message suivant
        if wrongEmail {
            return "Mauvais email"
        } else if wrongPassword {
            return "Mauvais mot de passe"
        } else {
            return " "
        }
    }
    
    
    // Voici les variables pour la page de login
    @State private var email: String = "" // écriture du mail par l'utilisateur
    @State private var password: String = "" // écriture du mot de passe par l'utilisateur
    
    @State private var wrongEmail: Bool = false // variable pour vérifier si c'est le bon mail
    @State private var wrongPassword: Bool = false // variable pour vérifier si c'est le bon mot de passe
    @Binding var showingLoginScreen: Bool // variable pour passer à la page suivante
    @State private var username: String = "" // affichage du pseudo relié au compte

    
    var body: some View {
        ZStack { //Pour que l'image de fond soit dserrière le reste
            Image(.bgLogin)
                .resizable(resizingMode: .stretch) // pour que l'image de fond fonctionne
                .aspectRatio(contentMode: .fill) // pour que l'image de fond soit partout
                .ignoresSafeArea() // pour que l'image n'est pas de margin l'empêchant d'être partout
            
            VStack { // les reste de la page
                Spacer() // Espacement pour éviter que le logo touche le haut
                
                VStack { // Pour grouper la partie titre (logo, titre, catch phrase)
                    Spacer() // pour centrer les elements front de la page
                    
                    Image(.logo)
                        .resizable() // permet de changer la taille de l'image
                        .scaledToFill() // Approche pour remplir tout en maintenant l'aspect
                        .frame(width: getLogoSize(), height: getLogoSize()) // va chercher la function pour que selon la taille d'accessibilté choisi, le logo s'adapte niveau taille
                        .clipped() // Assure que l'image ne dépasse pas du cadre
                        .cornerRadius(8.0) //bords arrondis
                        .shadow(color: .cinematePurpleMid, radius: 20, x: 0, y: 0) // ombre de 20px placé pile au milieu de l'element dont il découle
                    
                    Text("Cinémates") // nom de l'appli
                        .font(Font.TeachersLargeTitle()) // utilise une font personnalisé (cf : FontExtensions.swift)
                        .fontWeight(.medium)
                    
                    Text("A la recherche du film parfait.") // catch phrase de l'appli
                        .font(Font.urbanistHeadline()) // utilise une font personnalisé (cf : FontExtensions.swift)
                        .fontWeight(.regular)
                    
                } // fin de la partie groupée titre
                .foregroundColor(Color.white) // Titre & catch phrases sont blancs (au lie u de remmtre même ligne à chacun, on le met sur leur parent groupe)
                .multilineTextAlignment(.center) // Si le texte grossit et à cause de ça doit revenir à la ligne, il reste quand même centré
                .padding(.vertical, 32) 
                
                Spacer () // Espacement avant le formulaire
                
                VStack (spacing : 12){  // formulaire de connexion, avec un espacement de 12px entre chaque enfant
                    VStack {  //Regroupement du titre connexion et du message d'erreur pout un placement plus propre
                        Text("Connexion")
                            .font(Font.staatlichesTitle2()) // utilise une autre font personnalisé (cf : FontExtensions.swift)
                            .foregroundColor(Color.white)
                            .frame( height: 25.0) // Donne une taille de cadre spécifique pour ce texte
                        
                        // Erreur si mauvais email ou mot de passe
                        Text(textWrong)
                            .font(.urbanistHeadline())
                            .foregroundColor(Color.red)
                            .multilineTextAlignment(.center) // si le message prend plus d'une ligne (par ex si changement de taille d'accessibilité), le texte s'aligne au milieu
                    }
                    
                    VStack (spacing : 16) { // regroupe les inputsViews et le boutton d'envoie
                        Group { // regroupe les inputsViews email et mot de passe
                            LogInputView(logInput: $email, wrongLogInput: $wrongEmail,
                                         logLabel: "Email" , logSymbol: "envelope", logInputName : "Email" ) // appel le code se trouvant dans LogInputView.swift
                            
                            
                            LogInputView(logInput: $password, wrongLogInput: $wrongPassword, logLabel: "password" , logSymbol: "lock"  , logInputName : "Mot de passe" ) // same mais avec des variables différentes
                        }
                        
                        
                        Button("Mot de passe oublié ?") { //faux bouton 
                            
                        }
                        .foregroundColor(.white)
                        
                        Button {
                            authenticateUser(email: email, password: password) // appel fonction authenticateUser pour vérifier si l'email et le mot de passe sont justes

                        } label: {
                            HStack {
                                Spacer() // pour mettre bien le texte au milieu
                                Text("Se connecter")
                                    .font(.staatlichesHeadline())
                                Spacer()
                            }
                        }
                        .frame(height: 52.0)
                        .foregroundColor(.white)
                        .background(Color.cinematePurpleLight)
                        .cornerRadius(8.0)
                        
                        
                        HStack { // separateur entre connexion normal et par un element extérieur
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
                        
                        HStack { // group des 3 element extérieurs pour se connecter
                             // Vu que ce seont des faux boutons, ils sont utilisés pour se connecter rapidement pour les présentations sans passer par le test email et mdp
                            Button { // donne directement le pseudo et passe directement à la page suivante
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
                                .overlay(  //Permet de créer une bordure en mettant un rectangle invisible au dessus
                                    RoundedRectangle(cornerRadius: 8.0) // Utilise le même rayon de coin que pour le fond
                                        .stroke(.cinemateGrayDark, lineWidth: 1) // Permet de créer une bordure colorée et arrondie
                                )
                                .padding(.trailing, 8) 
                            }
                            
                            Button { // same pour ce bouton
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
                        
                        
                        Button("Créer un compte") { // nouvelle fois, un faux bouton
                            
                        }
                        .padding(.vertical)
                    }
                    
                }
                .font(Font.urbanistSubHeadline())
                .padding(.vertical)
                
            } // Fin du VStack comprenand tout sauf l'image de fond
            .foregroundColor(.cinemateWhite) // presque tout les textes sont en blanc
            .fontWeight(.regular) // presque tout les textes sont en regular
            .padding(.horizontal) // pour que tout les éléments (sauf le background) ne touche pas les côtés
            .padding(.bottom, 20) // Ajouter un peu d'espace en bas pour éviter que le contenu touche le bord
            .frame(maxHeight: .infinity) // Permet de ne pas faire déborder le contenu à l'écran
        }
    }
        
        func getLogoSize() -> CGFloat { // fonction qui selon la taille d'accessibilité choisi agrandit ou rétrécie le logo
            let baseSize: CGFloat = 66 // Taille par défaut pour le logo
            switch sizeCategory {
            case .extraSmall ,.small: //tailles d'accessibilités
                return baseSize * 0.75 //taille de base du logo rétrécie ou agrandit par multiplication
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

    // fonction qui vérifie si l'email et le mot de passe sont vrai ou faux
        func authenticateUser(email: String, password: String) { 
            //si équivalent les 2 alors on donne le username et la page ne s'affiche plus pour passer à la prochaine page 
            if email.lowercased() == "admin@example.com" {
                wrongEmail = false
                if password == "123abc" {
                    wrongPassword = false
                    username = "VeuveNoire"
                    showingLoginScreen = false
                // si faux change ces variables pour être envoyé à LogInputView.swift qui va adapter textWrong en circonstance (email à priorité sur textrong pour corriger dans l'ordre)
                } else {
                    wrongPassword = true
                }
            } else {
                wrongEmail = true
            }
        }
}

    // partie abandonné par manque de temps, était pour éviter des doublons entre les boutons element extérieurs
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
