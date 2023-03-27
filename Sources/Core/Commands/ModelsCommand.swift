//
//  ModelsCommand.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import ArgumentParser
import Foundation
import OpenAIKit

struct ModelsCommand: ParsableCommand, AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "models",
        abstract: "Lists the currently available models, and provides basic information about each one such as the owner and availability."
    )
    
    func runAsync() async throws {
        let models = try await AIClient.shared.ai.models.list()

        print("Models count:", models.description)
    }
}
