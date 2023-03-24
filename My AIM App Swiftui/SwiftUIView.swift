//
//  SwiftUIView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 24/03/2023.
//

import SwiftUI

struct SwiftUIView: View {
    @State var articles: [Article] = []
    @State var proceed: Bool = false
    
    var body: some View {
        VStack {
            if !proceed {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .task {
                    fetchArticles()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        proceed = true
                    }
                }
                
            } else {
                ContentView(articles: articles)
            }
        }
    }
    
    func fetchArticles() {
        let apiKey = "4dc3ec1f64c0486e97f6ef5f7e04b14d"
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(apiKey)")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
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
        
    //    return articles
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
