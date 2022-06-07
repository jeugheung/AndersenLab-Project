//
//  SearchResponse.swift
//  Stocks-And
//
//  Created by Andrey Kim on 30.05.2022.
//

import Foundation

struct SearchResponse: Codable {
    let count: Int
    let result: [SearchResults]
}

struct SearchResults: Codable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
}
