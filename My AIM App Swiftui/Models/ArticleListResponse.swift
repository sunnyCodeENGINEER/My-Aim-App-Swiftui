//
//  ArticleListResponse.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 24/03/2023.
//

import Foundation

struct Source: Codable {
    let id: String?
    let name: String?
}

struct Article: Codable {
    let author: String?
    let title: String
    let description: String?
    let urlToImage: URL?
    let publishedAt: String
    let content: String?
}

struct ArticleListResponse: Codable {
    let articles: [Article]
}

//func fetchArticles() -> [Article] {
//    let apiKey = "4dc3ec1f64c0486e97f6ef5f7e04b14d"
//    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(apiKey)")
//    var articles: [Article] = []
//    
//    URLSession.shared.dataTask(with: url!) { data, response, error in
//        if let error = error {
//            print(error.localizedDescription)
//            return
//        }
//        
//        guard let data = data else {
//            print("No Data was received from NewsApi.org")
//            return
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            let articleListTesponse = try decoder.decode(ArticleListResponse.self, from: data)
//            articles = articleListTesponse.articles
//            return articles
//            print(articleListTesponse.articles)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }.resume()
//    
////    return articles
//}
