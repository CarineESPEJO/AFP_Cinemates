//
//  SettingsView.swift
//  Cinemates
//
//  Created by apprenant98 on 30/01/2025.
//

import SwiftUI

struct SettingsAppView: View {
        @State private var notificationsEnabled = true
        @State private var showTitlesInLanguage = true
        @State private var selectedTheme = "Auto"

        let themes = [
            ("Auto", "Choisir le thème par défaut"),
            ("Clair", "Thème clair"),
            ("Sombre", "Thème sombre")
        ]

        var body: some View {
            NavigationView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Notifications
                    SectionView(title: "Notifications") {
                        Toggle(isOn: $notificationsEnabled) {
                            Label("Autoriser les notifications", systemImage: "bell")
                        }
                        .toggleStyle(SwitchToggleStyle(tint: .purple))
                    }

                   
                    SectionView(title: "Titres") {
                        Toggle(isOn: $showTitlesInLanguage) {
                            Label {
                                VStack(alignment: .leading) {
                                    Text("Afficher le titre dans votre langue")
                                    Text("Les titres s'affichent par défaut en anglais")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            } icon: {
                               Image(systemName: "note.text")
                            }
                        }
                        .toggleStyle(SwitchToggleStyle(tint: .purple))
                    }

                    // Thème
                    Text("Thème")
                        .font(.headline)
                        .foregroundColor(.white)

                    VStack(spacing: 10) {
                        ForEach(themes, id: \.0) { theme, description in
                            Button(action: {
                                selectedTheme = theme
                            }) {
                                HStack {
                                    Image(systemName: selectedTheme == theme ? "largecircle.fill.circle" : "circle")
                                        .foregroundColor(selectedTheme == theme ? .purple : .gray)
                                        .font(.title2)

                                    Text(description)
                                        .foregroundColor(.white)
                                        .font(.body)

                                    Spacer()
                                }
                                .padding(.vertical, 8)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.leading, 5)

                    Spacer()
                }
                .padding()
                .background(Color("cinemateBlack").edgesIgnoringSafeArea(.all))

                .toolbarColorScheme(.light, for: .navigationBar)
                .foregroundColor(.white)
                .navigationBarItems(leading: Button(action: {}) {
                    HStack {

                    }
                    .foregroundColor(.white)
                })
            }
        }
    }

    
    struct SectionView<Content: View>: View {
        let title: String
        let content: Content

        init(title: String, @ViewBuilder content: () -> Content) {
            self.title = title
            self.content = content()
        }

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.cinemateWhite)
                VStack {
                    content
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
        }
    }


    #Preview {
        SettingsAppView()
    }


