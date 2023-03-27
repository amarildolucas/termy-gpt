//
//  AIClient.swift
//  
//
//  Created by Amarildo João Custódio Lucas on 27/03/23.
//

import AsyncHTTPClient
import Foundation
import OpenAIKit

struct AIClient {
    private static var apiKey: String {
        ProcessInfo.processInfo.environment["OPENAI_API_KEY"] ?? ""
    }

    static let shared = AIClient()
    var ai: Client
    
    private init() {
        ai = Self.setupClient()
    }
}

extension AIClient {
    private static func setupClient() -> Client {
        let httpClient = AsyncHTTPClient.HTTPClient(eventLoopGroupProvider: .createNew)
        let configuration = Configuration(apiKey: apiKey)
        
        return OpenAIKit.Client(httpClient: httpClient, configuration: configuration)
    }
}
