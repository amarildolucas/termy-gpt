//
//  Completion.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import Foundation
import OpenAIKit

extension Completion {
    static func with(
        model: ModelID,
        text: String,
        maxTokens: Int,
        temperature: Double
    ) async throws -> Completion {
        try await AIClient.shared.ai.completions.create(
            model: model,
            prompts: [text],
            maxTokens: maxTokens,
            temperature: temperature
        )
    }
}

extension Completion: CustomStringConvertible {
    public var description: String {
        var results = ""
        choices.forEach { results += "\($0.description)\n" }
        
        return results
    }
}
