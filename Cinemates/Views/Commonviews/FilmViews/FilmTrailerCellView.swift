//
//  FilmTrailerCellView.swift
//  Cinemates
//
//  Created by Carine ESPEJO on 02/02/2025.
//

import SwiftUI
import WebKit

//struct to show the trailer of the film on its description pageView
struct FilmTrailerCellView: View {
    //take the movie
    var film: Film
    
    var body: some View {
        VStack { //part where trailer will be
            YouTubePlayerView(film: film) //func to call trailer
                .frame(width: 371, height: 209)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
    
    // UIViewControllerRepresentable pour intégrer un WKWebView dans SwiftUI
    struct YouTubePlayerView: UIViewControllerRepresentable {
        //take the film
        var film: Film

        
        func makeUIViewController(context: Context) -> UIViewController {
            let webView = WKWebView()
            
            // Create l'URL of the iframe YouTube with the vidéo from the string URL in movie database
            let videoID = extractVideoID(from: film.filmTrailer.absoluteString)
            //transform into URL to be a playable element
            let embedURL = "https://www.youtube.com/embed/\(videoID)?autoplay=1&modestbranding=1&rel=0&showinfo=0"
            //transform string into URL
            let url = URL(string: embedURL)!
            //request of the video
            let request = URLRequest(url: url)
            
            // Charge the request into  WebView
            webView.load(request)
            
            // Return an UIViewController with WebView
            let viewController = UIViewController()
            viewController.view = webView
            return viewController
        }

        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            // nothing here because I didn't have time to go into more throughfully
        }
        
        // function to extract the trailer ID  from the URL YouTube
        private func extractVideoID(from urlString: String) -> String {
            guard let url = URL(string: urlString) else {
                return ""
            }
            let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems
            if let videoID = queryItems?.first(where: { $0.name == "v" })?.value {
                return videoID
            }
            
            // If the URL does not contain parameters of the form "v=VIDEO_ID"
            if let path = url.pathComponents.last {
                return path
            }
            return ""
        }
    }
}

#Preview {
    FilmTrailerCellView(film: filmsDatabase[0])
}
