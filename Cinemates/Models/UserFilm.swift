//
//  Untitled.swift
//  Cinemates
//
//  Created by apprenant98 on 30/01/2025.
//

//Base de données de la liste de films des users (entière, vus, à voir, favoris)


import Foundation
import DeveloperToolsSupport

struct UserFilm: Identifiable {
    var id = UUID()
    
    var filmsSeen: [Film]
    var filmsToSee: [Film]
    var filmsFavorites: [Film]
    
   
}

var veuveNoireFilms = UserFilm(
    filmsSeen: [theBatman,
                theDarkKnight,
                theGodfather,
                theMatrix,
                theShawshankRedemption,
                titanic],
    filmsToSee: [avatarWayOfWater,
                 guardiansGalaxy3,
                 inception,
                 johnWick4,
                 missionImpossible7,
                 oppenheimer,
                 spiderManAcross],
    filmsFavorites: [theGodfather,
                     theMatrix,
                     theBatman,
                    theDarkKnight,
                     theShawshankRedemption,
                     titanic]
)


var janeSmithFilms = UserFilm(
    filmsSeen: [theShawshankRedemption, theDarkKnight, theMatrix],
    filmsToSee: [inception, theGodfather, avatarWayOfWater, guardiansGalaxy3, johnWick4],
    filmsFavorites: [theMatrix, theShawshankRedemption] // Choix manuel parmi les films vus
)

var alexTheExplorerFilms = UserFilm(
    filmsSeen: [theGodfather, titanic, theMatrix],
    filmsToSee: [theDarkKnight, theShawshankRedemption, avatarWayOfWater, guardiansGalaxy3, johnWick4],
    filmsFavorites: [theGodfather, theMatrix] // Choix manuel parmi les films vus
)

var lisaBFilms = UserFilm(
    filmsSeen: [theDarkKnight, titanic, theShawshankRedemption],
    filmsToSee: [inception, theGodfather, avatarWayOfWater, dunePartTwo],
    filmsFavorites: [titanic, theShawshankRedemption] // Choix manuel parmi les films vus
)

var mikeBrownFilms = UserFilm(
    filmsSeen: [inception, theMatrix, theDarkKnight],
    filmsToSee: [theShawshankRedemption, titanic, avatarWayOfWater],
    filmsFavorites: [inception, theDarkKnight] // Choix manuel parmi les films vus
)

var saraLeeFilms = UserFilm(
    filmsSeen: [theShawshankRedemption, titanic, theMatrix],
    filmsToSee: [inception, theGodfather, avatarWayOfWater, johnWick4],
    filmsFavorites: [theShawshankRedemption, theMatrix] // Choix manuel parmi les films vus
)

var tomGreenFilms = UserFilm(
    filmsSeen: [theMatrix, titanic, inception],
    filmsToSee: [theGodfather, theShawshankRedemption, avatarWayOfWater, guardiansGalaxy3],
    filmsFavorites: [inception, titanic] // Choix manuel parmi les films vus
)

var emilyWhiteFilms = UserFilm(
    filmsSeen: [theDarkKnight, titanic, theShawshankRedemption],
    filmsToSee: [inception, theGodfather, avatarWayOfWater, wicked],
    filmsFavorites: [theShawshankRedemption, theDarkKnight] // Choix manuel parmi les films vus
)

var samuelBlackFilms = UserFilm(
    filmsSeen: [theGodfather, theShawshankRedemption, titanic],
    filmsToSee: [theMatrix, inception],
    filmsFavorites: [theGodfather, titanic] // Choix manuel parmi les films vus
)

var lilyGreyFilms = UserFilm(
    filmsSeen: [theMatrix, theDarkKnight, theGodfather],
    filmsToSee: [inception, theShawshankRedemption],
    filmsFavorites: [theMatrix, theGodfather] // Choix manuel parmi les films vus
)

var usersFilmsLists = [
    veuveNoireFilms,
    janeSmithFilms,
    alexTheExplorerFilms,
    lisaBFilms,
    mikeBrownFilms,
    saraLeeFilms,
    tomGreenFilms,
    emilyWhiteFilms,
    samuelBlackFilms,
    lilyGreyFilms
    ]
