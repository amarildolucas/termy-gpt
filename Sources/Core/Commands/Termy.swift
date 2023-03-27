//
//  Termy.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import ArgumentParser
import Foundation

// Handle commands and execution.
public struct Termy: ParsableCommand {
    public static let version = "1.0.0"
    
    public static let configuration = CommandConfiguration(
        commandName: "termy",
        abstract: "Your terminal AI assistant.",
        version: Self.version,
        subcommands: [
            ModelsCommand.self,
            CreateCompletionsCommand.self,
            ChatCommand.self
        ]
    )
    
    public init() {}
}
