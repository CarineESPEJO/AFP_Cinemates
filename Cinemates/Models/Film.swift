//
//  FilmDataBase.swift
//  Cinemates
//
//  Created by Carine ESPEJO on 30/01/2025.
//

//Its an app POC made by beginners, the teachers couldn't teach us everything to make to work the database
//As beginners, we didn't use APIs so everything is somewhere in the folders
import Foundation
import DeveloperToolsSupport

struct Film : Identifiable {
    // automatic ID
    var id = UUID()
    
    //infos
    var filmName: String
    var filmPoster : ImageResource
    
    var filmDate : String
    var filmGenres : [String]

    // here we went with the idea that if there was an APIS, we would receivre the total minutes of the movie
    var filmDurationMinutes : Int
    // var to transform the duration from minutes to hours and minutes
    var filmDurationHours : String {
        var durationHours : Int = 0
        var durationMinutes : Int = 0
        
        // take the minutes and divide them by (mn per hour)
        durationHours = filmDurationMinutes / 60
        // give the rest as minutes
        durationMinutes = filmDurationMinutes % 60

        // to clean the display by adding 0 to have everytime xxhyy and not xxh or xxhy
        if durationMinutes == 0 {
            return ("\(durationHours)h00")
        } else if durationMinutes < 10 {
            return ("\(durationHours)h0\(durationMinutes)")
        } else {
            return ("\(durationHours)h\(durationMinutes)")
        }
    }

    //Notes from other platforms 
    var filmAlloCineRating : Double
    var filmCinematesRating : Double  
    var filmFriendsRating : Double    
    
    
    var filmPlatforms : [String:ImageResource]
    var filmDescription : String
    var filmCasting : [String:ImageResource]
    // to put a trailer on the movie description page
    var filmTrailer : URL
    
    var filmNotes : [Notation] = []
}


// data base of movies

var avatarWayOfWater = Film(
    filmName: "Avatar: La Voie de l’Eau",
    filmPoster: ImageResource.avatarWayOfWaterPoster,
    filmDate: "2022",
    filmGenres: ["Science-fiction", "Fantastique"],
    filmDurationMinutes: 192,
    filmAlloCineRating: 4.3,
    filmCinematesRating: 4.2,
    filmFriendsRating: 4.4,
    filmPlatforms: [
        "Disney+": .disneyIcon
    ],
    filmDescription: "Jake Sully et Neytiri doivent protéger leur famille lorsque Pandora est à nouveau menacée. Ils se réfugient chez un peuple aquatique et découvrent un nouvel environnement aussi fascinant que dangereux.",
    filmCasting: [
        "Sam Worthington": .samWorthingtonPicture,
        "Zoe Saldana": .zoeSaldanaPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/p4JYFpfQHSM")!
)

var blancheNeigeEtLeChasseur = Film(
    filmName: "Blanche Neige et le Chasseur",
    filmPoster: ImageResource.blancheNeigeEtLeChasseurPoster,
    filmDate: "2012",
    filmGenres: ["Action", "Aventure", "Fantastique"],
    filmDurationMinutes: 127,
    filmAlloCineRating: 3.1,
    filmCinematesRating: 3.3,
    filmFriendsRating: 3.2,
    filmPlatforms: [
        "Prime Video": .primeVideoIcon
    ],
    filmDescription: "Pour échapper à la reine maléfique, Blanche Neige doit fuir dans la forêt et se préparer à affronter son destin.",
    filmCasting: [
        "Kristen Stewart": .kristenStewartPicture,
        "Charlize Theron": .charlizeTheronPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/Ou5N9fnCKis")!
)


var dunePartTwo = Film(
    filmName: "Dune: Deuxième Partie",
    filmPoster: ImageResource.dunePartTwoPoster,
    filmDate: "2024",
    filmGenres: ["Science-fiction", "Aventure", "Action"],
    filmDurationMinutes: 166,
    filmAlloCineRating: 4.6,
    filmCinematesRating: 4.5,
    filmFriendsRating: 4.7,
    filmPlatforms: [
        "HBO Max": .hboIcon,
        "Apple TV": .appletvIcon
    ],
    filmDescription: "Paul Atréides poursuit son voyage prophétique parmi les Fremen et prépare sa revanche contre ceux qui ont détruit sa famille. Tandis qu’il embrasse son destin, il doit choisir entre l’amour et le pouvoir absolu.",
    filmCasting: [
        "Timothée Chalamet": .timotheeChalametPicture,
        "Zendaya": .zendayaPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/SUfv36bB5jA")!
)

var guardiansGalaxy3 = Film(
    filmName: "Les Gardiens de la Galaxie Vol. 3",
    filmPoster: ImageResource.guardiansGalaxy3Poster,
    filmDate: "2023",
    filmGenres: ["Science-fiction", "Aventure"],
    filmDurationMinutes: 150,
    filmAlloCineRating: 4.3,
    filmCinematesRating: 4.2,
    filmFriendsRating: 4.4,
    filmPlatforms: [
        "Disney+": .disneyIcon
    ],
    filmDescription: "Les Gardiens doivent affronter un nouvel ennemi redoutable qui menace l’équilibre de la galaxie. Tandis que Rocket découvre son passé, l’équipe se prépare à un ultime combat.",
    filmCasting: [
        "Chris Pratt": .chrisPrattPicture,
        "Zoe Saldana": .zoeSaldanaPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/WxA-eZ72FsQ")!
)

var inception = Film(
    filmName: "Inception",
    filmPoster: .inceptionPoster,
    filmDate: "2010",
    filmGenres: ["Sci-Fi", "Thriller"],
    filmDurationMinutes: 148,
    filmAlloCineRating: 4.4,
    filmCinematesRating: 4.3,
    filmFriendsRating: 4.5,
    filmPlatforms: [
        "Netflix": .netflixIcon,
        "Amazon Prime": .primeVideoIcon
    ],
    filmDescription: "Dom Cobb, un voleur spécialisé dans l’espionnage des rêves, doit accomplir une mission unique : implanter une idée dans l’esprit d’un héritier. Mais son passé trouble menace l’opération. Entre illusions et réalité, le danger est omniprésent.",
    filmCasting: [
        "Leonardo DiCaprio": .leonardoDicaprioPicture,
        "Joseph Gordon-Levitt": .josephGordonPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/HcoZbHBDHQA")!
)

var johnWick4 = Film(
    filmName: "John Wick: Chapitre 4",
    filmPoster: ImageResource.johnWick4Poster,
    filmDate: "2023",
    filmGenres: ["Action", "Thriller"],
    filmDurationMinutes: 169,
    filmAlloCineRating: 4.4,
    filmCinematesRating: 4.5,
    filmFriendsRating: 4.6,
    filmPlatforms: [
        "Amazon Prime": .primeVideoIcon
    ],
    filmDescription: "John Wick continue sa lutte contre la Grande Table et cherche un moyen de se libérer définitivement. Ses ennemis sont plus puissants que jamais, et la vengeance sera sanglante.",
    filmCasting: [
        "Keanu Reeves": .keanuReevesPicture,
        "Donnie Yen": .donnieYenPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/pjjXHE1W_dc")!
)


var missionImpossible7 = Film(
    filmName: "Mission: Impossible - Dead Reckoning Partie 1",
    filmPoster: ImageResource.missionImpossible7Poster,
    filmDate: "2023",
    filmGenres: ["Action", "Thriller"],
    filmDurationMinutes: 163,
    filmAlloCineRating: 4.5,
    filmCinematesRating: 4.4,
    filmFriendsRating: 4.6,
    filmPlatforms: [
        "Paramount+": .paramountIcon
    ],
    filmDescription: "Ethan Hunt et son équipe affrontent leur mission la plus périlleuse : neutraliser une intelligence artificielle incontrôlable avant qu’elle ne tombe entre de mauvaises mains.",
    filmCasting: [
        "Tom Cruise": .tomCruisePicture,
        "Rebecca Ferguson": .rebeccaFergusonPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/kz34RaRBczI")!
)

var oppenheimer = Film(
    filmName: "Oppenheimer",
    filmPoster: ImageResource.oppenheimerPoster,
    filmDate: "2023",
    filmGenres: ["Drame", "Historique"],
    filmDurationMinutes: 180,
    filmAlloCineRating: 4.7,
    filmCinematesRating: 4.6,
    filmFriendsRating: 4.8,
    filmPlatforms: [
        "Amazon Prime": .primeVideoIcon,
        "Apple TV": .appletvIcon
    ],
    filmDescription: "L’histoire fascinante de J. Robert Oppenheimer, le scientifique derrière la bombe atomique. Entre génie et dilemmes moraux, il assiste à la naissance d’une arme qui changera le monde à jamais.",
    filmCasting: [
        "Cillian Murphy": .cillianMurphyPicture,
        "Emily Blunt": .emilyBluntPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/CoXtvSRpHgM")!
)

var spiderManAcross = Film(
    filmName: "Spider-Man: Across the Spider-Verse",
    filmPoster: ImageResource.spiderManAcrossPoster,
    filmDate: "2023",
    filmGenres: ["Animation", "Action"],
    filmDurationMinutes: 140,
    filmAlloCineRating: 4.8,
    filmCinematesRating: 4.7,
    filmFriendsRating: 4.9,
    filmPlatforms: [
        "Netflix": .netflixIcon,
        "Disney+": .disneyIcon
    ],
    filmDescription: "Miles Morales traverse le multivers et rencontre une équipe de Spider-Héros chargée de le protéger. Mais lorsqu’un nouveau danger surgit, il doit choisir entre sauver ceux qu’il aime ou préserver l’équilibre de l’univers.",
    filmCasting: [
        "Shameik Moore": .shameikMoorePicture,
        "Hailee Steinfeld": .haileeSteinfeldPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/iZSRP2UYtO4")!
)

var theBatman = Film(
    filmName: "The Batman",
    filmPoster: ImageResource.theBatmanPoster,
    filmDate: "2022",
    filmGenres: ["Action", "Drame"],
    filmDurationMinutes: 176,
    filmAlloCineRating: 4.5,
    filmCinematesRating: 4.4,
    filmFriendsRating: 4.6,
    filmPlatforms: [
        "HBO Max": .hboIcon,
        "Amazon Prime": .primeVideoIcon
    ],
    filmDescription: "Bruce Wayne, alias Batman, enquête sur une série de meurtres orchestrés par le Riddler. Alors que le mystère s’épaissit, il découvre des vérités troublantes sur Gotham et son propre passé.",
    filmCasting: [
        "Robert Pattinson": .robertPattinsonPicture,
        "Zoë Kravitz": .zoeKravitzPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/hGQo1axtj60")!
)


var theDarkKnight = Film(
    filmName: "The Dark Knight",
    filmPoster: ImageResource.theDarkKnightPoster,
    filmDate: "2008",
    filmGenres: ["Action", "Crime", "Drama"],
    filmDurationMinutes: 152,
    filmAlloCineRating: 4.5,
    filmCinematesRating: 4.6,
    filmFriendsRating: 4.7,
    filmPlatforms: [
        "HBO Max": .hboIcon,
        "Amazon Prime": .primeVideoIcon
    ],
    filmDescription: "Batman affronte le Joker, un criminel imprévisible semant le chaos à Gotham. Tandis que le justicier lutte pour sauver la ville, il doit faire face à des choix moraux déchirants. L’ordre et l’anarchie s’affrontent dans une guerre psychologique intense.",
    filmCasting: [
        "Christian Bale": .christanBalePicture,
        "Heath Ledger": .heathLedgePicture
    ],
    filmTrailer: URL(string: "https://youtu.be/UMgb3hQCb08")!
)

var theGodfather = Film(
    filmName: "The Godfather",
    filmPoster: .theGodfatherPoster,
    filmDate: "1972",
    filmGenres: ["Crime", "Drama"],
    filmDurationMinutes: 175,
    filmAlloCineRating: 4.6,
    filmCinematesRating: 4.7,
    filmFriendsRating: 4.1,
    filmPlatforms: [
        "Paramount+": .paramountIcon,
        "Apple TV": .appletvIcon
    ],
    filmDescription: "Vito Corleone, chef d’une puissante famille mafieuse, voit son empire menacé. Son fils Michael, d’abord réticent, est contraint d’entrer dans le monde du crime. Entre trahisons et vendettas, il embrasse son destin de parrain.",
    filmCasting: [
        "Marlon Brando": .marlonBrandoPicture,
        "Al Pacino": .alPacinoPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/bmtuIhesQWA")!
)

var theMatrix = Film(
    filmName: "The Matrix",
    filmPoster: .theMatrixPoster,
    filmDate: "1999",
    filmGenres: ["Action", "Sci-Fi"],
    filmDurationMinutes: 136,
    filmAlloCineRating: 4.7,
    filmCinematesRating: 4.9,
    filmFriendsRating: 3.2,
    filmPlatforms: [
        "Netflix": .netflixIcon,
        "HBO Max": .hboIcon
    ],
    filmDescription: "Thomas Anderson, alias Neo, découvre que la réalité est une illusion contrôlée par des machines. Guidé par Morpheus et Trinity, il apprend à défier les lois de ce monde. Sa quête le mène à devenir l’élu capable de libérer l’humanité.",
    filmCasting: [
        "Keanu Reeves": .keanuReevesPicture,
        "Carrie-Anne Moss": .carrieAnneMossPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/8xx91zoASLY")!
)


var theShawshankRedemption = Film(
    filmName: "The Shawshank Redemption",
    filmPoster: .theShawshankRedemptionPoster,
    filmDate: "1994",
    filmGenres: ["Drama"],
    filmDurationMinutes: 142,
    filmAlloCineRating: 4.1,
    filmCinematesRating: 4.9,
    filmFriendsRating: 4.8,
    filmPlatforms: [
        "Hulu": .huluIcon,
        "Netflix": .netflixIcon
    ],
    filmDescription: "Condamné à tort pour le meurtre de sa femme, Andy Dufresne purge une peine à Shawshank. Il se lie d’amitié avec Red et gagne le respect des détenus. À travers l’espoir et la patience, il prépare un plan d’évasion audacieux.",
    filmCasting: [
        "Morgan Freeman": .morganFreemanPictures,
        "Tim Robbins": .timRobbinsPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/wux4Vwy3_x8")!
)


var titanic = Film(
    filmName: "Titanic",
    filmPoster: .titanicPoster,
    filmDate: "1997",
    filmGenres: ["Drama", "Romance"],
    filmDurationMinutes: 195,
    filmAlloCineRating: 3.8,
    filmCinematesRating: 4.1,
    filmFriendsRating: 8.3,
    filmPlatforms: [
        "Disney+": .disneyIcon,
        "Hulu": .huluIcon
    ],
    filmDescription: "Rose, une jeune aristocrate, tombe amoureuse de Jack, un artiste sans le sou, à bord du Titanic. Leur amour interdit se heurte aux conventions sociales et au destin tragique du navire. Entre romance et catastrophe, leur histoire devient légendaire.",
    filmCasting: [
        "Leonardo DiCaprio": .leonardoDicaprioPicture,
        "Kate Winslet": .kateWinsletPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/Quf4qIkD3KY")!
)

var abigail = Film(
    filmName: "Abigail",
    filmPoster: ImageResource.abigailPoster,
    filmDate: "2019",
    filmGenres: ["Aventure", "Fantastique"],
    filmDurationMinutes: 109,
    filmAlloCineRating: 3.1,
    filmCinematesRating: 3.5,
    filmFriendsRating: 3.3,
    filmPlatforms: [
        "Prime Video": .primeVideoIcon
    ],
    filmDescription: "Dans un monde où les villes sont en quarantaine, Abigail part à la recherche de la vérité.",
    filmCasting: [
        "Tinatin Dalakishvili": .tinatinDalakishviliPicture,
        "Rinal Mukhametov": .rinalMukhametovPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/0tlT6IGTyuc")!
)


var charliesAngels = Film(
    filmName: "Charlie's Angels",
    filmPoster: ImageResource.charliesAngelsPoster,
    filmDate: "2019",
    filmGenres: ["Action", "Aventure", "Comédie"],
    filmDurationMinutes: 118,
    filmAlloCineRating: 3.2,
    filmCinematesRating: 3.5,
    filmFriendsRating: 3.4,
    filmPlatforms: [
        "Amazon Prime": .primeVideoIcon
    ],
    filmDescription: "Les Anges de Charlie sont de retour avec un nouveau trio de détectives chargées de missions dangereuses et mystérieuses.",
    filmCasting: [
        "Kristen Stewart": .kristenStewartPicture,
        "Naomi Scott": .naomiScottPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/gdYGlXvea_s")!
)

var leMondeFantastiqueDOz = Film(
    filmName: "Le Monde Fantastique d'Oz",
    filmPoster: ImageResource.leMondeFantastiqueDOzPoster,
    filmDate: "2013",
    filmGenres: ["Aventure", "Fantastique"],
    filmDurationMinutes: 130,
    filmAlloCineRating: 3.2,
    filmCinematesRating: 3.4,
    filmFriendsRating: 3.3,
    filmPlatforms: [
        "Disney+": .disneyIcon
    ],
    filmDescription: "Un magicien de cirque se retrouve transporté dans un monde magique où il doit remplir une mission héroïque.",
    filmCasting: [
        "James Franco": .jamesFrancoPicture,
        "Mila Kunis": .milaKunisPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/2Hsq8qq0jdo")!
)

var leSeigneurDesAnneaux = Film(
    filmName: "Le Seigneur des Anneaux : La Communauté de l'Anneau",
    filmPoster: ImageResource.leSeigneurDesAnneauxPoster,
    filmDate: "2001",
    filmGenres: ["Aventure", "Fantastique"],
    filmDurationMinutes: 178,
    filmAlloCineRating: 4.4,
    filmCinematesRating: 4.6,
    filmFriendsRating: 4.5,
    filmPlatforms: [
        "Prime Video": .primeVideoIcon
    ],
    filmDescription: "Un jeune hobbit et ses compagnons entreprennent un voyage épique pour détruire un anneau maléfique et sauver la Terre du Milieu.",
    filmCasting: [
        "Elijah Wood": .elijahWoodPicture,
        "Ian McKellen": .ianMcKellenPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/nalLU8i4zgs")!
)

var leHobbitUnVoyageInattendu = Film(
    filmName: "Le Hobbit : Un Voyage Inattendu",
    filmPoster: ImageResource.leHobbitUnVoyageInattenduPoster,
    filmDate: "2012",
    filmGenres: ["Aventure", "Fantastique"],
    filmDurationMinutes: 169,
    filmAlloCineRating: 3.8,
    filmCinematesRating: 4.0,
    filmFriendsRating: 3.9,
    filmPlatforms: [
        "Prime Video": .primeVideoIcon
    ],
    filmDescription: "Bilbo Baggins rejoint un groupe de nains dans une aventure pour récupérer un trésor volé et affronter un dragon.",
    filmCasting: [
        "Martin Freeman": .martinFreemanPicture,
        "Ian McKellen": .ianMcKellenPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/tiy7peMH3g8")!
)

var lesAnimauxFantastiques = Film(
    filmName: "Les Animaux Fantastiques",
    filmPoster: ImageResource.lesAnimauxFantastiquesPoster,
    filmDate: "2016",
    filmGenres: ["Aventure", "Fantastique"],
    filmDurationMinutes: 133,
    filmAlloCineRating: 3.7,
    filmCinematesRating: 4.1,
    filmFriendsRating: 4.0,
    filmPlatforms: [
        "HBO Max": .hboIcon
    ],
    filmDescription: "Newt Scamander, un magizoologiste, se retrouve au cœur d'aventures magiques dans le New York des années 1920.",
    filmCasting: [
        "Eddie Redmayne": .eddieRedmaynePicture,
        "Katherine Waterston": .katherineWaterstonPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/jC8xuFcMq20")!
)

var lesAnimauxFantastiquesLesCrimesDeGrindelwald = Film(
    filmName: "Les Animaux Fantastiques : Les Crimes de Grindelwald",
    filmPoster: ImageResource.lesAnimauxFantastiquesLesCrimesDeGrindelwaldPoster,
    filmDate: "2018",
    filmGenres: ["Aventure", "Fantastique"],
    filmDurationMinutes: 134,
    filmAlloCineRating: 3.3,
    filmCinematesRating: 3.7,
    filmFriendsRating: 3.6,
    filmPlatforms: [
        "HBO Max": .hboIcon
    ],
    filmDescription: "Grindelwald s'échappe et mène une guerre secrète contre les sorciers qui résistent à sa montée en puissance.",
    filmCasting: [
        "Eddie Redmayne": .eddieRedmaynePicture,
        "Jude Law": .judeLawPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/Dnb6eAfSHtw")!
)

var leSeptiemeFils = Film(
    filmName: "Le Septième Fils",
    filmPoster: ImageResource.leSeptiemeFilsPoster,
    filmDate: "2014",
    filmGenres: ["Action", "Aventure", "Fantastique"],
    filmDurationMinutes: 102,
    filmAlloCineRating: 2.9,
    filmCinematesRating: 3.1,
    filmFriendsRating: 3.0,
    filmPlatforms: [
        "Netflix": .netflixIcon
    ],
    filmDescription: "Un jeune homme devient l'apprenti d'un sorcier pour combattre une sorcière maléfique.",
    filmCasting: [
        "Jeff Bridges": .jeffBridgesPicture,
        "Ben Barnes": .benBarnesPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/xh9YLkb3OTo")!
)

var twilight = Film(
    filmName: "Twilight",
    filmPoster: ImageResource.twilightPoster,
    filmDate: "2008",
    filmGenres: ["Romance", "Fantastique"],
    filmDurationMinutes: 122,
    filmAlloCineRating: 3.7,
    filmCinematesRating: 3.9,
    filmFriendsRating: 3.8,
    filmPlatforms: [
        "Prime Video": .primeVideoIcon
    ],
    filmDescription: "Un amour interdit entre une humaine et un vampire bouleverse la vie tranquille de la jeune Bella.",
    filmCasting: [
        "Kristen Stewart": .kristenStewartPicture,
        "Robert Pattinson": .robertPattinsonPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/xzO_Iiwt4b4")!
)

var wicked = Film(
    filmName: "Wicked",
    filmPoster: ImageResource.wickedPoster,
    filmDate: "2024",
    filmGenres: ["Fantastique", "Comédie musicale"],
    filmDurationMinutes: 120,
    filmAlloCineRating: 4.2,
    filmCinematesRating: 4.5,
    filmFriendsRating: 4.4,
    filmPlatforms: [
        "Cinema": .cinemaIcon
    ],
    filmDescription: "L'histoire de l'amitié de la Sorcière de l'Ouest et de Glinda, la bonne sorcière, avant l'arrivée de Dorothy.",
    filmCasting: [
        "Ariana Grande": .arianaGrandePicture,
        "Cynthia Erivo": .cynthiaErivoPicture
    ],
    filmTrailer: URL(string: "https://youtu.be/x6A83rXWrE8")!
)





















// Liste des films
var filmsDatabase = [avatarWayOfWater,blancheNeigeEtLeChasseur,charliesAngels, dunePartTwo ,guardiansGalaxy3, inception, johnWick4, leMondeFantastiqueDOz, leSeigneurDesAnneaux, leHobbitUnVoyageInattendu, lesAnimauxFantastiques, lesAnimauxFantastiquesLesCrimesDeGrindelwald, leSeptiemeFils, missionImpossible7, oppenheimer, spiderManAcross, theBatman, theDarkKnight, theGodfather, theMatrix, theShawshankRedemption, titanic, twilight,wicked]
