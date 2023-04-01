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
