//
//  MainAppView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 21/02/2023.
//

import SwiftUI

struct MainAppView: View {
    // A temporary fix to check if everything else is working accordingly
    @State var articles: [Article] = []
    
    var body: some View {
        VStack {
            NavigationStack {
                List(articles, id: \.title) { article in
                    NavigationLink {
                        DetailedArticleView(article: article)
                    } label: {
                        NewsListRow(title: article.title, summary: article.description ?? "", urlToImage: article.urlToImage)
                    }
                }
                .listStyle(.plain)
            }
        }
        .task {
            fetchArticles()
        }
        
    }
    
    func fetchArticles() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=4dc3ec1f64c0486e97f6ef5f7e04b14d")
        
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
                print("here\n")
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
