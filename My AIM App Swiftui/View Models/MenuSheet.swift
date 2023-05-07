//
//  MenuSheet.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 01/05/2023.
//

import SwiftUI

struct MenuSheet: View {
    @State var animate: Bool = false
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
                        .frame(width: 50, height: 50)
                }
                Spacer()
            }
            
            VStack {
                MenuButtons(title: "Results", delay: 0.5, animate: $animate)
            }
        }
    }
}

struct MenuSheet_Previews: PreviewProvider {
    static var previews: some View {
        MenuSheet()
    }
}

struct MenuButtons: View {
    var title: String
    var delay: Double
    @Binding var animate: Bool
    
    var body: some View {
        HStack {
            HStack {
                Text(title)
                    .padding()
            }
            .padding(.horizontal)
            .background(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2))
            .offset(x: !animate ? -1000 : 0)
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

