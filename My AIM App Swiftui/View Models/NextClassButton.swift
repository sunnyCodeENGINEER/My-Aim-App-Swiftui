//
//  NextClassButton.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 21/02/2023.
//

import SwiftUI

struct NextClassButton: View {
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                ZStack {
                    HStack {
                        Spacer()
                        Image(systemName: "map.fill")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.4)
                            .rotationEffect(Angle(degrees: -25))
                            .offset(x: 50, y: 100)
                    }
                        
                    
                    VStack {
                        Spacer()
                        HStack(alignment: .bottom) {
                            Text("Next\nClass")
                                .font(.title)
                            
                            Spacer()
                        }
                        .padding()
                        .background(.blue.opacity(0.3))
                    }
                }
                .clipped()
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "mappin")
                        .resizable()
                    .scaledToFit()
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.9,
                   height: 200)
            .background(.blue.opacity(0.3))
            
        }
    }
}

struct NextClassButton_Previews: PreviewProvider {
    static var previews: some View {
        NextClassButton()
    }
}
