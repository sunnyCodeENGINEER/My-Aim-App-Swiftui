//
//  ContentView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 21/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var articles: [Article] = []
    
    var body: some View {
        VStack {
            Text("Articles")
            Text("\(articles.count)")
            
            List(articles, id: \.title) { article in
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.description ?? "")
                        .font(.body)
                    AsyncImage(url: article.urlToImage ?? nil) { image in
                        image
                            .resizable()
                            .scaledToFit()
                        } placeholder: {
                        ProgressView()
                    }
                    
//                    CacheAsyncImage(url: article.urlToImage ?? URL(string: "")) { phase in
//                        switch phase {
//                        case .empty:
//                            ProgressView()
//                        case .success(let image):
//                            image
//                                .resizable()
//                                .scaledToFit()
//                        case .failure(let error):
//                            Image(systemName: "exclamationmark.triangle.fill")
//                        default:
//                            Image(systemName: "exclamationmark.triangle.fill")
//                        }
//                    }
                }
            }
//            .environmentObject(ImageCache.shared)
        }
        .task {
            print("\(URLCache.shared.memoryCapacity)")
            URLCache.shared.memoryCapacity = 1024 * 1024 * 512
            print("\(URLCache.shared.memoryCapacity)")
            fetchArticles()
        }
    }
    
    func fetchArticles() {
        let apiKey = "4dc3ec1f64c0486e97f6ef5f7e04b14d"
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(apiKey)")
        
        let request = URLRequest(url: url!, cachePolicy: .returnCacheDataElseLoad)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("No Data was received from NewsApi.org")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let articleListTesponse = try decoder.decode(ArticleListResponse.self, from: data)
                articles = articleListTesponse.articles
                print(articleListTesponse.articles)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

//class ImageCache: ObservableObject {
//    static let shared = ImageCache()
//    
//    @Published private var cache = [URL: UIImage]()
//    
//    func set(_ image: UIImage, for url: URL) {
//        cache[url] = image
//    }
//    
//    func get(for url: URL) -> UIImage? {
//        cache[url]
//    }
//}
