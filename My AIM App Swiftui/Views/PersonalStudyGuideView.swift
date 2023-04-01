//
//  PersonalStudyGuideView.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 30/03/2023.
//

import SwiftUI

struct PersonalStudyGuideView: View {
    @ObservedObject var chatGPTviewModel = ChatGPTModel()
    @State var text: String = ""
    @State var models = [String]()
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(models, id: \.self) { string in
                    Text(string)
                }
            }
            Spacer()
            HStack {
                TextField("Type here...", text: $text)
                Button {
                    send()
                } label: {
                    Text("Send")
                }
            }
//            .padding()
        }
        .padding()
        .onAppear {
            chatGPTviewModel.setup()
        }
    }
    
    func send() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        models.append("Me: \(text)")
        chatGPTviewModel.send(text: text) { respnse in
            DispatchQueue.main.async {
                self.models.append("ChatGPT: " + respnse)
                self.text = ""
            }
        }
    }
}

struct PersonalStudyGuideView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalStudyGuideView()
    }
}
