//
//  AsyncParsableCommand.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import ArgumentParser
import Foundation

public protocol AsyncParsableCommand: ParsableCommand {
    mutating func runAsync() async throws
}

extension ParsableCommand {
    public static func main() async {
        do {
            // `parseAsRoot` uses the program's command-line arguments when passing `nil`
            var command = try parseAsRoot(nil)
            
            if var asyncCommand = command as? AsyncParsableCommand {
                try await asyncCommand.runAsync()
            } else {
                try command.run()
            }
        } catch {
            exit(withError: error)
        }
    }
}
