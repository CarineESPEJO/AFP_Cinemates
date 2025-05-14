//
//  UserDataBase.swift
//  Cinemates
//
//  Created by apprenant98 on 30/01/2025.
//

import Foundation
import DeveloperToolsSupport

struct User : Identifiable {
    
    var id = UUID()
    
    // login
    var email: String
    var password: String
    
    // user profil
    
    var username: String
    var profilPicture: ImageResource
    var description: String // <= 150 caractères
    
    // films
    
    var userFilm : UserFilm
    
    // Social
    
    var userFriends: [User]
}


// Base de données fictive de 6 utilisateurs

var veuveNoire = User(
        email: "john.doe@email.com",
        password: "password123",
        username: "johnny_doe",
        profilPicture: .profilPic0,
        description: "Fan de films d'action et de science-fiction.",
        userFilm: veuveNoireFilms,
        userFriends: [janeSmith,
                      mikeBrown,
                      lisaB,
                      tomGreen,
                      emilyWhite,
                      samuelBlack]
    )
    
var janeSmith = User(
        email: "jane.smith@email.com",
        password: "password456",
        username: "jane_smith",
        profilPicture: .profilPic1,
        description: "Passionnée de comédies romantiques et de voyages.",
        userFilm: janeSmithFilms,
        userFriends: []
    )
    
var alexTheExplorer = User (
        email: "alex.jones@email.com",
        password: "password789",
        username: "alex_the_explorer",
        profilPicture: .profilPic2,
        description: "Adepte des films d'aventure et de nature.",
        userFilm: alexTheExplorerFilms,
        userFriends: []
    )
    
var lisaB = User (
        email: "lisa.braillon@email.com",
        password: "password101",
        username: "lisa_b",
        profilPicture: .profilPic5,
        description: "Amoureuse des films dramatiques et des documentaires.",
        userFilm: lisaBFilms,
        userFriends: []
    )
    
var mikeBrown = User (
        email: "michael.brown@email.com",
        password: "password202",
        username: "mike_brown",
        profilPicture: .profilPic4,
        description: "Je suis un passionné de films de science-fiction et d'espionnage.",
        userFilm: mikeBrownFilms,
        userFriends: []
    )
    
var saraLee = User (
        email: "sara.lee@email.com",
        password: "password303",
        username: "sara_lee",
        profilPicture: .profilPic7,
        description: "Amatrice de films d'horreur et de thrillers psychologiques.",
        userFilm: saraLeeFilms,
        userFriends: []
    )


var tomGreen = User(
    email: "tom.green@email.com",
    password: "password404",
    username: "tom_green",
    profilPicture: .profilPic6,
    description: "J'adore les films de science-fiction et d'animation.",
    userFilm: tomGreenFilms,
    userFriends: [alexTheExplorer]
)

var emilyWhite = User(
    email: "emily.white@email.com",
    password: "password505",
    username: "emily_white",
    profilPicture: .profilPic14,
    description: "Une passionnée de films d'horreur et de thrillers psychologiques.",
    userFilm: emilyWhiteFilms,
    userFriends: [saraLee, lisaB]
)

var samuelBlack = User(
    email: "samuel.black@email.com",
    password: "password606",
    username: "samuel_black",
    profilPicture: .profilPic10,
    description: "Amateur de films de guerre et de drames historiques.",
    userFilm: samuelBlackFilms,
    userFriends: [mikeBrown]
)

var lilyGrey = User(
    email: "lily.grey@email.com",
    password: "password707",
    username: "lily_grey",
    profilPicture: .profilPic13,
    description: "J'adore les films d'action et les comédies.",
    userFilm: lilyGreyFilms,
    userFriends: [tomGreen, alexTheExplorer]
)

// Liste complète des utilisateurs
var usersDatabase = [
    veuveNoire,
    janeSmith,
    alexTheExplorer,
    lisaB,
    mikeBrown,
    saraLee,
    tomGreen,
    emilyWhite,
    samuelBlack,
    lilyGrey
]


var communityOneDatabase = [
    veuveNoire,
    janeSmith,
    alexTheExplorer
]
