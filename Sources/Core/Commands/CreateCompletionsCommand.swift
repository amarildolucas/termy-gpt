//
//  CreateCompletionsCommand.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import ArgumentParser
import Foundation
import OpenAIKit

struct CreateCompletionsCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "create-completions",
        abstract: """
        Given a prompt, the model will return one or more predicted completions.
        """
    )
    
    @Argument(help:
        """
        The prompt(s) to generate completions for, encoded as a string.
        """
    )
    private var prompt: String

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
            What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.

            We generally recommend altering this or top_p but not both.
        """
    )
    private var temperature: Double?
}

extension CreateCompletionsCommand: AsyncParsableCommand {
    func runAsync() async throws {
        let completion = try await Completion.with(
            model: Model.Identifier(id: model ?? Model.defaultCompletions),
            text: prompt,
            maxTokens: maxTokens ?? Completion.defaultMaxTokens,
            temperature: temperature ?? Completion.defaultTemperature
        )
        
        Log.message(completion.description)
    }
}

