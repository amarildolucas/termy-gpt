//
//  Chat.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import Foundation
import OpenAIKit

extension Chat {
    static func with(
        model: ModelID,
        message: String,
        maxTokens: Int,
        temperature: Double
    ) async throws -> Chat {
        try await AIClient.shared.ai.chats.create(
            model: model,
            messages: [.user(content: message)],
            temperature: temperature,
            maxTokens: maxTokens
        )
    }
}

extension Chat: CustomStringConvertible {
    public var description: String {
        var results = ""
        choices.forEach {
            results += "\($0.description)\n"
        }
        
        return results
    }
}
