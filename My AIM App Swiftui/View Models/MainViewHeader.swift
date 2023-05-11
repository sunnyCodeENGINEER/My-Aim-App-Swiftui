//
//  MainViewHeader.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 10/03/2023.
//

import SwiftUI

struct MainViewHeader: View {
    var userLastName: String = "Doe"
    var userFirstName: String = "John"
    @Binding var isPresented: Bool
    @Binding var currentMenu: CurrentMenu
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .shadow(color: .black.opacity(0.5), radius: 5)
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 2)
                                .foregroundColor(.white)
                        }
                        .padding(.leading)
                }
                .sheet(isPresented: $isPresented) {
                    MenuSheet(animate: $isPresented, currentMenu: $currentMenu)
                }
                
                Spacer()
                
                Text("Welcome! MR.")
                Text(userLastName)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Rectangle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.secondary)
                    .padding(.trailing)
            }
            .padding(.vertical)
            
        }
    }
}

struct MainViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainViewHeader(isPresented: .constant(false), currentMenu: .constant(.home))
        
        MainViewHeader(isPresented: .constant(false), currentMenu: .constant(.home))
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}

