//
//  MenuSheet.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 01/05/2023.
//

import SwiftUI

struct MenuSheet: View {
    @Binding var animate: Bool
    @Binding var currentMenu: CurrentMenu
//    var dismis
    var body: some View {
        ZStack {
            VStack {
                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        animate = false
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .padding(.top)
                Spacer()
            }
            
            VStack {
                if currentMenu != .home {
                    MenuButtons(title: "Home", delay: 0.5, animate: $animate, currentMenu: $currentMenu, setTo: .home)
                }
                if currentMenu != .results {
                    MenuButtons(title: "Results", delay: 0.5, animate: $animate, currentMenu: $currentMenu, setTo: .results)
                }
            }
        }
    }
}

struct MenuSheet_Previews: PreviewProvider {
    static var previews: some View {
        MenuSheet(animate: .constant(false), currentMenu: .constant(.home))
    }
}

struct MenuButtons: View {
    var title: String
    var delay: Double
    @Binding var animate: Bool
    @Binding var currentMenu: CurrentMenu
    var setTo: CurrentMenu
    
    var body: some View {
        Button {
            currentMenu = setTo
            DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                withAnimation(.easeInOut(duration: 1)) {
                    animate = false
                }
            }
        } label: {
            HStack {
                HStack {
                    Text(title)
                        .padding()
                }
                .padding(.horizontal)
                .background(RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2))
                .offset(y: !animate ? 1000 : 0)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation(.easeInOut(duration: 1)) {
                        animate = true
                    }
                }
            }
        }
    }
}

