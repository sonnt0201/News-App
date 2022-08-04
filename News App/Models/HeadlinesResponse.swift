//
//  File.swift
//  News App
//
//  Created by Sơn Nguyễn on 03/08/2022.
//

import Foundation

struct HeadlinesResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article?]
    
}

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}
