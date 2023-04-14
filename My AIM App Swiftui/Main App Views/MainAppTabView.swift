//
//  MainAppTabView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 01/04/2023.
//

import SwiftUI

struct MainAppTabView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            MainAppView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                }
            PersonalStudyGuideView()
                .tabItem {
                    Image(systemName: "book.fill")
                }
        }
    }
}

struct MainAppTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppTabView()
        
        MainAppTabView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
