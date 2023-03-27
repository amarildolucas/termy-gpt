//
//  Model.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import Foundation
import OpenAIKit

extension Model {
    static var all: [Model] {
        get async throws {
            try await AIClient.shared.ai.models.list()
        }
    }
    
    static func with(id: String) async throws -> Model {
        try await AIClient.shared.ai.models.retrieve(id: id)
    }
}

extension Model: CustomStringConvertible {
    public var description: String {
        """
        Model ID:\t\t \(id)
        Owned By:\t\t \(ownedBy)\n
        """
    }
}
