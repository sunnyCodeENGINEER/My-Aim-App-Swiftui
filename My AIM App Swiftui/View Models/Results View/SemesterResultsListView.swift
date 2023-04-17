//
//  SemesterResultsListView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 16/04/2023.
//

import SwiftUI

struct SemesterResultsListView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    NavigationLink {
                        UserResultsView()
                    } label: {
                        HStack {
                            Text("YEAR 3, Semester 1")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.primary)
                            Spacer()
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.85)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15)
                    .fill(.thickMaterial)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 3)
                    }))
                .padding(.horizontal)
                .navigationTitle("RESULTS")
            }
        }
    }
}

struct SemesterResultsListView_Previews: PreviewProvider {
    static var previews: some View {
        SemesterResultsListView()
    }
}
