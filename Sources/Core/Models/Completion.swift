//
//  Completion.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import Foundation
import OpenAIKit

extension Completion {
    static let defaultMaxTokens = 16
    static let defaultTemperature: Double = 1.0
    
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

extension Completion.Choice: CustomStringConvertible {
    public var description: String {
        "\(index + 1). \(text.trimmingCharacters(in: .whitespacesAndNewlines))"
    }
}
