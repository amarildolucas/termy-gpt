//
//  Choice.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import Foundation
import OpenAIKit

extension Completion.Choice: CustomStringConvertible {
    public var description: String {
        "\(index + 1). \(text.trimmingCharacters(in: .whitespacesAndNewlines))"
    }
}

extension Chat.Choice: CustomStringConvertible {
    public var description: String {
        switch message {
        case .assistant(let content):
            return content
        case .system(let content):
            return content
        case .user(let content):
            return content
        }
    }
}
