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
            Text("First View")
                .tabItem {
                    Image(systemName: "house.fill")
                }
            Text("Second View")
                .tabItem {
                    Image(systemName: "newspaper.fill")
                }
            Text("Third View")
                .tabItem {
                    Image(systemName: "book.fill")
                }
        }
    }
}

struct MainAppTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppTabView()
    }
}
