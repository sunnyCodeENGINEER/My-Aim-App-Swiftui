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
    @State var messageBlocks = [MessageBlock]()
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(messageBlocks, id: \.id) { messageBlock in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(messageBlock.author + ":")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Text(messageBlock.content)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(.thinMaterial))
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white, lineWidth: 2)
                        }
                        .padding([.horizontal, .bottom])
                        .shadow(radius: 5, y: 5)
                        
                        Spacer()
                    }
                }
                            
//                ForEach(models, id: \.self) { string in
//                    Text(string)
//                }
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
        messageBlocks.append(MessageBlock(author: "Me", content: text))
        chatGPTviewModel.send(text: text) { respnse in
            DispatchQueue.main.async {
                self.models.append("ChatGPT: " + respnse)
                self.messageBlocks.append(MessageBlock(author: "ChatGPT", content: respnse))
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

struct MessageBlock: Hashable, Identifiable {
    let id = UUID()
    var author: String
    var content: String
}
