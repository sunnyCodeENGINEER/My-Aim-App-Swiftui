//
//  MainAppTabView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 01/04/2023.
//

import SwiftUI

struct MainAppTabView: View {
    @State var currentMenu: CurrentMenu = .home
    
    var body: some View {
        if currentMenu == .home{
            TabView{
                HomeView(currentMenu: $currentMenu)
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
        } else if currentMenu == .results {
            SemesterResultsListView(currentMenu: $currentMenu)
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
