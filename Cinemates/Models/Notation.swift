//
//  NotationView.swift
//  Cinemates
//
//  Created by apprenant98 on 30/01/2025.
//
import Foundation

// Structure Notation
struct Notation: Identifiable {
    var id = UUID()
    
    var userId: UUID
    var scenarioNote: Double
    var visualNote: Double
    var musicNote: Double
    
    var generalNote: Double {
        (scenarioNote + visualNote + musicNote) / 3
    }
    
    var comment: String   // <= 500 caractères
}

// Générer des UUID pour les utilisateurs
let user1Id = UUID()
let user2Id = UUID()
let user3Id = UUID()
let user4Id = UUID()






// Base de données des notations pour chaque film

// Inception
var inceptionNotations = [
    Notation(
        userId: janeSmith.id,
        scenarioNote: 4.8,  // Note entre 0 et 5
        visualNote: 4.5,
        musicNote: 4.4,
        comment: "Un film fascinant, avec un scénario complexe et bien écrit. Les effets visuels sont époustouflants, mais la musique pourrait être un peu plus mémorable. Malgré tout, un film d'une profondeur incroyable qui pousse à la réflexion."
    ),
    Notation(
        userId: user2Id,
        scenarioNote: 4.4,
        visualNote: 4.7,
        musicNote: 4.6,
        comment: "Un excellent film de Nolan. L'idée de rêve dans le rêve est originale et bien menée. Les visuels sont magnifiques, mais le scénario est parfois difficile à suivre. Une bande-son immersive mais pas inoubliable."
    )
]

// The Dark Knight
var darkKnightNotations = [
    Notation(
        userId: user3Id,
        scenarioNote: 5.0,
        visualNote: 4.7,
        musicNote: 4.5,
        comment: "Le meilleur film de super-héros que j'ai jamais vu. Un scénario parfait avec des personnages profonds et une tension palpable. Heath Ledger est incroyable en Joker. Les effets visuels sont impressionnants et la musique épique."
    ),
    Notation(
        userId: user4Id,
        scenarioNote: 4.8,
        visualNote: 4.5,
        musicNote: 4.5,
        comment: "Un film exceptionnel, avec une profondeur psychologique que peu de films de super-héros atteignent. Le casting est incroyable, mais certains effets visuels ont un peu vieilli. Un chef-d'œuvre moderne."
    )
]

// Shawshank Redemption
var shawshankNotations = [
    Notation(
        userId: user1Id,
        scenarioNote: 5.0,
        visualNote: 4.2,
        musicNote: 4.5,
        comment: "Un classique absolu. L'histoire de Shawshank est poignante et bien racontée. Les performances sont incroyables, en particulier Morgan Freeman. La bande sonore ajoute de la profondeur, bien que le film soit assez simple visuellement."
    ),
    Notation(
        userId: user2Id,
        scenarioNote: 4.9,
        visualNote: 4.0,
        musicNote: 4.3,
        comment: "L'un des films les plus émouvants que j'ai vus. L'histoire de l'amitié et de la rédemption est magnifique. Cependant, visuellement, ce n'est pas un film marquant. La musique est subtile mais parfaite pour le ton du film."
    )
]

// The Godfather
var godfatherNotations = [
    Notation(
        userId: user3Id,
        scenarioNote: 5.0,
        visualNote: 4.7,
        musicNote: 4.7,
        comment: "Le sommet du cinéma. Un chef-d'œuvre sur la famille, la loyauté et la corruption. Les performances de Marlon Brando et Al Pacino sont inoubliables. Le film est visuellement magnifique et la musique est iconique."
    ),
    Notation(
        userId: user4Id,
        scenarioNote: 4.9,
        visualNote: 4.5,
        musicNote: 4.6,
        comment: "Un classique intemporel. Le film capture l'essence de la famille mafieuse d'une manière qui n'a jamais été égalée. La narration est brillante, mais l'esthétique visuelle n'est pas aussi innovante que d'autres grands films."
    )
]

// The Matrix
var matrixNotations = [
    Notation(
        userId: user1Id,
        scenarioNote: 4.6,
        visualNote: 5.0,
        musicNote: 4.8,
        comment: "Un film révolutionnaire qui a changé le paysage du cinéma d'action. Le scénario est génial et les effets visuels étaient une avancée technologique à l'époque. La bande-son est l'une des meilleures des années 90."
    ),
    Notation(
        userId: user2Id,
        scenarioNote: 4.3,
        visualNote: 5.0,
        musicNote: 4.5,
        comment: "Une véritable œuvre d'art en matière d'effets spéciaux et de cinéma d'action. L'histoire est un peu difficile à suivre parfois, mais l'impact visuel et la musique sont inoubliables. Très influent."
    )
]

// Titanic
var titanicNotations = [
    Notation(
        userId: user3Id,
        scenarioNote: 4.0,
        visualNote: 4.8,
        musicNote: 4.9,
        comment: "Une histoire d'amour poignante sur fond de catastrophe historique. La romance entre Jack et Rose est un peu trop sucrée, mais les visuels et la bande-son sont magnifiques. Un film qui fait pleurer à chaque vision."
    ),
    Notation(
        userId: user4Id,
        scenarioNote: 4.3,
        visualNote: 4.5,
        musicNote: 4.6,
        comment: "Bien que la romance soit clichée, le film fait un excellent travail pour capturer la tragédie du Titanic. Les visuels sont grandioses et la musique, en particulier la chanson thème, est emblématique."
    )
]

// Base de données des notations pour chaque film
var filmsNotationsDatabase: [String: [Notation]] = [
    "Inception": inceptionNotations,
    "The Dark Knight": darkKnightNotations,
    "Shawshank Redemption": shawshankNotations,
    "The Godfather": godfatherNotations,
    "The Matrix": matrixNotations,
    "Titanic": titanicNotations
]

