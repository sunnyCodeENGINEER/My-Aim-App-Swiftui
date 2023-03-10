//
//  NewsListRow.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 09/03/2023.
//

import SwiftUI

struct NewsListRow: View {
    var title: String = "Title of some news..."
    var summary: String = "The summary of the news goes here..."
    
    var body: some View {
        HStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 100)
                .padding(.horizontal, 10)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                Text(summary)
                    .font(.caption)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "square.and.arrow.up")
                    
                    HStack {
                        Image(systemName: "clock.arrow.circlepath")
                        
                        Text("19 mins ago")
                            .font(.footnote)
                    }
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 20)
                        .fill(.gray))
                }
            }
            .frame(height: 100)
            
            Spacer()
        }
        .padding(5)
        .padding(.vertical, 10)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.blue.opacity(0.3))
            .padding(2))
    }
}

struct NewsListRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsListRow()
        
        NewsListRow()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
