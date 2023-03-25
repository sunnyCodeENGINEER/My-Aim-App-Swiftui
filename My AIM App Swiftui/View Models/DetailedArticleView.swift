//
//  DetailedArticleView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 25/03/2023.
//

import SwiftUI

struct DetailedArticleView: View {
    @State var title: String = "Title"
    @State var author: String = "Author"
    @State var dateString: String = "2023-03-26T12:01:00Z"
    @State var content: String = "Content goes here."
    let urlToImage: URL?
    @State var articleDate: Date = .now
    
    var body: some View {
        ScrollView {
            AsyncImage(url: urlToImage, content: { phase in
                switch phase {
                case .empty :
                    ProgressView()
                        .frame(height: 300)
                        .padding(.vertical)
                case .success(let image):
                    image
                        .resizable()
                        .frame(height: 300)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .padding(.vertical)
                case .failure:
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .padding()
                        .frame(width: 300, height: 300)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.gray))
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                default:
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .padding()
                        .frame(width: 300, height: 300)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.gray))
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                }
            })
            .frame(height: 300)
            .padding(.vertical)
            
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                Text(author)
                    .font(.headline)
                Text(articleDate.formatted(date: .abbreviated, time: .standard))
                    .font(.caption)
                    .fontDesign(.monospaced)
                Divider()
                Text(content)
            }
        }
        .padding()
        .onAppear {
            articleDate = getArticleDate()
        }
    }
    
    func getArticleDate() -> Date {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        var articleDate: Date = Date()
        
        if let date = dateformatter.date(from: dateString) {
            articleDate = date
            print("Successfull")
        } else {
            print("There's a problem with the date string")
        }
        
        return articleDate
    }
}

struct DetailedArticleView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedArticleView(urlToImage: URL(string: "data:image/png;base64,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"))
    }
}