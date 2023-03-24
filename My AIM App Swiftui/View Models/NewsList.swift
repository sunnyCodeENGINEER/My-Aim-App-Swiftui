//
//  NewsList.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 24/03/2023.
//

import SwiftUI

struct NewsList: View {
    @State var articles: [Article] = []
    
    var body: some View {
        List(articles, id: \.title) { article in
            NewsListRow(title: article.title, summary: article.description ?? "", urlToImage: article.urlToImage)
                .task {
                    fetchArticles()
                }
        }
        
    }
    
    func fetchArticles() {
        let apiKey = "4dc3ec1f64c0486e97f6ef5f7e04b14d"
        let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=\(apiKey)")
        
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

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
    }
}
