//
//  NextClassButton.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 21/02/2023.
//

import SwiftUI

struct NextClassButton: View {
    var course: String = "MATH 351"
    var location: String = "PB 001"
    var time: String = "10:30 am - 12:30 pm"
    
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                ZStack {
                    
                    ZStack {
                        VStack {
                            Spacer()
                            HStack(alignment: .bottom) {
                                VStack(alignment: .leading) {
                                    Text("Next\nClass")
                                        .font(.title)
                                    HStack {
                                        Text("Course: ")
                                        Text(course)
                                    }
                                    HStack {
                                        Text("Location: ")
                                        Text(location)
                                    }
                                    HStack {
                                        Text("Time: ")
                                        Text(time)
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15)
                                .fill(.thinMaterial)
                                .shadow(radius: 5)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(.white, lineWidth: 2)
                                })
                        }
                        
                        HStack {
                            Spacer()
                            Image(systemName: "map.fill")
                                .resizable()
                                .scaledToFit()
                                .opacity(0.2)
                                .rotationEffect(Angle(degrees: -25))
                                .offset(x: 50, y: 100)
                                .clipped()
                                .cornerRadius(15)
                        }
                    }
                    .padding()
                }
                .clipped()
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "mappin")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 2, x: 3, y: 5)
                        .offset(y: -20)
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width * 0.9,
                   height: 200)
        }
    }
}

struct NextClassButton_Previews: PreviewProvider {
    static var previews: some View {
        NextClassButton()
    }
}
