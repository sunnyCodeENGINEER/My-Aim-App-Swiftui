//
//  ChatGPTResponseViewModel.swift
//  My AIM App Swiftui
//
//  Created by Emmanuel Donkor on 30/03/2023.
//

import Foundation
import OpenAISwift

final class ChatGPTModel: ObservableObject {
    init() {
        
    }
    
    private var client: OpenAISwift?
    
    func setup(text: String, completion: @escaping (String) -> Void) {
        client = OpenAISwift(authToken: "sk-QXt4bE1MioeMKFGAJXNRT3BlbkFJyS1df5lolztcpNPhork")
        
        client?.sendCompletion(with: text, maxTokens: 5000, completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
