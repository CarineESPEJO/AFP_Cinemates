import SwiftUI
import WebKit

struct FilmTrailerCellView: View {
    var film: Film
    
    var body: some View {
        VStack {
            YouTubePlayerView(film: film)
                .frame(width: 371, height: 209)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
    
    // UIViewControllerRepresentable pour intégrer un WKWebView dans SwiftUI
    struct YouTubePlayerView: UIViewControllerRepresentable {
        var film: Film
        
        func makeUIViewController(context: Context) -> UIViewController {
            let webView = WKWebView()
            
            // Créer l'URL de l'iframe YouTube avec la vidéo
            let videoID = extractVideoID(from: film.filmTrailer.absoluteString)
            let embedURL = "https://www.youtube.com/embed/\(videoID)?autoplay=1&modestbranding=1&rel=0&showinfo=0"
            let url = URL(string: embedURL)!
            let request = URLRequest(url: url)
            
            // Charger la requête dans le WebView
            webView.load(request)
            
            // Retourner un UIViewController avec le WebView
            let viewController = UIViewController()
            viewController.view = webView
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            // Rien à faire ici pour l'instant
        }
        
        // Fonction pour extraire l'ID de la vidéo depuis l'URL YouTube
        private func extractVideoID(from urlString: String) -> String {
            guard let url = URL(string: urlString) else {
                return ""
            }
            let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems
            if let videoID = queryItems?.first(where: { $0.name == "v" })?.value {
                return videoID
            }
            
            // Si l'URL ne contient pas de paramètres de la forme "v=VIDEO_ID"
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
