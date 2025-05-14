//
//  SwiftUIView2.swift
//  Cinemates
//
//  Created by apprenant108 on 31/01/2025.
//

import SwiftUI

struct FiltersView: View {
    @State private var searchText: String = ""
    @State private var selectedStartYear: String = "2009"
    @State private var selectedEndYear: String = "2025"
    @State private var selectedGenre: String = "Tous"
    @State private var selectedRating: String = "Tous"

   
    let platforms: [(name: String, image: String)] = [
        ("Cinéma", "cinemaIcon"),
        ("Disney+", "disneyIcon"),
        ("Netflix", "netflixIcon"),
        ("Prime Video", "primeVideoIcon"),
        ("Paramount", "paramountIcon"),
        ("Apple TV", "appletvIcon"),
        ("Hulu", "huluIcon"),
        ("HBO Max", "HBOIcon")
    ]
    
    @Environment(\.dismiss) var dismiss // Ajout de dismiss pour fermer la feuille

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Button {
                dismiss()
                
            } label : {
                HStack {
                Image (systemName: "chevron.left")
                            .font(.urbanistSubHeadline())
                Text("Retour")
               
            }
                .font(.urbanistHeadline())
                .padding(.vertical)
                .foregroundColor(.white)
                .cornerRadius(10)
            }

            VStack(alignment: .leading) {
                
                    YearsRow(title: "Années", selectedOption1: $selectedStartYear, selectedOption2: $selectedEndYear)
                    
            }
            .padding(.horizontal)


            VStack(alignment: .leading) {
                FilterRow(title: "Genre", selectedOption: $selectedGenre)
                NoteRow(title: "Note", selectedOption: $selectedRating)
            }
            .padding(.horizontal)

            
            VStack(alignment: .leading) {
                Text("Plateformes")
                    .font(.urbanistHeadline())
                    .fontWeight(.semibold)
                    .foregroundColor(.white)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(platforms, id: \.name) { platform in
                            VStack {
                                Image(platform.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                Text(platform.name)
                                    .font(.urbanistBody())
                                    .foregroundColor(.white)
                            }
                            .padding(8)
                        }
                    }
                }
            }
            .padding(.horizontal)

            Spacer()
        }
       
        .background(Color("cinemateBlack").edgesIgnoringSafeArea(.all))
    }
}


struct FilterRow: View {
    let title: String
    @Binding var selectedOption: String
    var options: [String] = ["Tous", "Action", "Thriller", "Comédie", "Drame", "Horreur"]
    
    var body: some View {
        HStack {
            Text(title)
                .font(.urbanistHeadline())
                .fontWeight(.semibold)
                .foregroundColor(.white)
                

            Spacer()
            
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(action: { selectedOption = option }) {
                        Text(option)
                    }
                }
            } label: {
                HStack {
                    Text(selectedOption)
                        .foregroundColor(.purple)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
        }
    }
}


struct NoteRow: View {
    let title: String
    @Binding var selectedOption: String
    var options: [String] = ["1 étoile", "2 étoile", "3 étoiles", "4 étoiles", "5 étoiles"]
    
    var body: some View {
        HStack {
            Text(title)
                .font(.urbanistHeadline())
                .fontWeight(.semibold)
                .foregroundColor(.white)
                

            Spacer()
            
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(action: { selectedOption = option }) {
                        Text(option)
                    }
                }
            } label: {
                HStack {
                    Text(selectedOption)
                        .foregroundColor(.purple)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
        }
    }
}


struct YearsRow: View {
    let title: String
    @Binding var selectedOption1: String
    @Binding var selectedOption2: String
    var options: [String] = ["1900", "1901", "1902", "1903", "1904", "1905", "1906", "1907", "1908", "1909", "1910", "1911", "1912", "1913", "1914", "1915", "1916", "1917", "1918", "1919", "1920", "1921", "1922", "1923", "1924", "1925", "1926", "1927", "1928", "1929", "1930", "1931", "1932", "1933", "1934", "1935", "1936", "1937", "1938", "1939", "1940", "1941", "1942", "1943", "1944", "1945", "1946", "1947", "1948", "1949", "1950", "1951", "1952", "1953", "1954", "1955", "1956", "1957", "1958", "1959", "1960", "1961", "1962", "1963", "1964", "1965", "1966", "1967", "1968", "1969", "1970", "1971", "1972", "1973", "1974", "1975", "1976", "1977", "1978", "1979", "1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025"]
    
    
    var body: some View {
        HStack {
            Text(title)
                .font(.urbanistHeadline())
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Spacer()
            
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(action: { selectedOption1 = option }) {
                        Text(option)
                    }
                }
            } label: {
                HStack {
                    Text(selectedOption1)
                        .foregroundColor(.purple)
                        .font(.urbanistHeadline())
                        .fontWeight(.semibold)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
                Text("-")
                Menu {
                    ForEach(options, id: \.self) { option in
                        Button(action: { selectedOption2 = option }) {
                            Text(option)
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedOption2)
                            .foregroundColor(.purple)
                            .font(.urbanistHeadline())
                            .fontWeight(.semibold)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
        }
    }
}


#Preview {
    FiltersView()
}
