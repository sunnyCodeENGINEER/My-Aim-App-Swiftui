//
//  SplashScreen.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 12/05/2023.
//

import SwiftUI

struct SplashScreen: View {
    @State var animate: Bool = false
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black.opacity(0.6), .black.opacity(0)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(animate ? 1.5 : 1)
                    .animation(.easeInOut(duration: 3).repeatForever(), value: animate)
                    .onAppear {
                        animate = true
                    }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
