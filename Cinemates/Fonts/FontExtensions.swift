//
//  FontExtensions.swift
//  App_test
//
//  Created by apprenant98 on 27/01/2025.
//


// FontExtensions.swift

import SwiftUI

// création de .font spéciaux selon nos fonts
extension Font {
    
    
    // Teachers
    static func TeachersLargeTitle() -> Font {
        // Définir une taille de police personnalisée sans UIKit
        return .custom("Teachers-Regular", size: 44)
    }
    
    
    // Staatliches
    static func staatlichesLargeTitle() -> Font {
        // Définir une taille de police personnalisée sans UIKit
        return .custom("Staatliches-Regular", size: 32)
    }
    
    static func staatlichesTitle2() -> Font {
        // Définir une taille de police personnalisée sans UIKit
        return .custom("Staatliches-Regular", size: 24)
    }
    
    static func staatlichesTitle3() -> Font {
        // Définir une taille de police personnalisée sans UIKit
        return .custom("Staatliches-Regular", size: 20)
    }
    
    static func staatlichesHeadline() -> Font {
        return .custom("Staatliches-Regular", size: 16)
    }
    
    
    // Urbanist
    static func urbanistHeadline() -> Font {
        return .custom("Urbanist-Regular", size: 16)
    }
    
    static func urbanistSubHeadline() -> Font {
        return .custom("Urbanist-Regular", size: 14)
    }
    
    static func urbanistBody() -> Font {
        return .custom("Urbanist-Regular", size: 12)
    }
}
