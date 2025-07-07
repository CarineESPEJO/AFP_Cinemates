//
//  FontExtensions.swift
//  Cinemates
//
//  Created by Carine ESPEJO on 27/01/2025.
//


import SwiftUI

// Create our own special fonts to call (to not be obligated to rewrite them all the time and have issues)
extension Font {
    
    
    // Teachers
    // Define a personnalized font size without UIKit
    static func TeachersLargeTitle() -> Font {
        return .custom("Teachers-Regular", size: 44)
    }
    
    
    // Staatliches
    static func staatlichesLargeTitle() -> Font {
        return .custom("Staatliches-Regular", size: 32)
    }
    
    static func staatlichesTitle2() -> Font {
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
