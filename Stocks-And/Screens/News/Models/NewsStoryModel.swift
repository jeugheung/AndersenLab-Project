//
//  NewsStoryModel.swift
//  Stocks-And
//
//  Created by Andrey Kim on 04.06.2022.
//

import Foundation

struct NewsStory: Codable {
    let category: String
    let datetime: TimeInterval
    let headline: String
    let image: String
    let related: String
    let source: String
    let summary: String
    let url: String
}
