//
//  HomeView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 01/04/2023.
//

import SwiftUI

struct HomeView: View {
    @State var isPresented: Bool = false
    @Binding var currentMenu: CurrentMenu
    
    var body: some View {
        ZStack {
            VStack {
                MainViewHeader(isPresented: $isPresented, currentMenu: $currentMenu)
//                    .onTapGesture {
//                        isPresented = true
//                    }
//                    .sheet(isPresented: $isPresented) {
//                        MenuSheet(animate: $isPresented, currentMenu: $currentMenu)
//                    }
                
                NextClassButton()
                
                MainAppView()
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(currentMenu: .constant(.home))
        
        HomeView(currentMenu: .constant(.home))
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
