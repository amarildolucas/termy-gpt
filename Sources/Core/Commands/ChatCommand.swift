//
//  ChatCommand.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import ArgumentParser
import Foundation
import OpenAIKit

struct ChatCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "chat",
        abstract: """
        Given a chat conversation, the model will return a chat completion response.
        """
    )
    
    @Argument(help:
        """
        The messages to generate chat completions for, in the chat format.
        """
    )
    private var message: String

    @Option(
        name: .long,
        help: """
        ID of the model to use. You can use the `termy models` command to see all available models.
        """
    )
    private var model: String?
    
    @Option(
        name: .shortAndLong,
        help: """
        The maximum number of tokens to generate in the completion.The token count of your prompt plus max-tokens cannot exceed the model's context length. Most models have a context length of 2048 tokens (except for the newest models, which support 4096).
        """
    )
    private var maxTokens: Int?
    
    @Option(
        name: .shortAndLong,
        help: """
        What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or top_p but not both.
        """
    )
    private var temperature: Double?
}

extension ChatCommand: AsyncParsableCommand {
    func runAsync() async throws {
        let chat = try await Chat.with(
            model: Model.Identifier(id: model ?? Model.defaultChat),
            message: message,
            maxTokens: maxTokens ?? Constants.defaultMaxTokens,
            temperature: temperature ?? Constants.defaultTemperature
        )

        Log.message(chat.description)
    }
}
