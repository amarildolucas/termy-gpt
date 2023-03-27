//
//  ModelsCommand.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import ArgumentParser
import Foundation
import OpenAIKit

struct ModelsCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "models",
        abstract: """
        Lists the currently available models, and provides basic information about each one such as the owner and availability.
        """
    )
    
    @Option(
        name: .shortAndLong,
        help: "Retrieves a model instance, providing basic information about the model such as the owner."
    )
    private var identifier: String?
}

extension ModelsCommand: AsyncParsableCommand {
    func runAsync() async throws {
        if let identifier = identifier {
            let model = try await Model.with(id: identifier)
            
            Log.message(model.description)
        } else {
            let models = try await Model.all

            Log.message("\(models.count) available models:\n")
            models.forEach { Log.message($0.description) }
        }
    }
}
