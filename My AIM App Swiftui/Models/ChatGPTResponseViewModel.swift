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
    
    func setup() {
        client = OpenAISwift(authToken: "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")
    }
    
    func send(text: String, completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text, maxTokens: 500, completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(output)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
