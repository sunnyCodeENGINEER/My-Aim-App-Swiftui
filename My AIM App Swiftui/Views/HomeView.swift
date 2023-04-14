//
//  HomeView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 01/04/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack {
                MainViewHeader()
                
                NextClassButton()
                
                MainAppView()
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
