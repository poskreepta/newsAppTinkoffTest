//
//  NewsData.swift
//  NewsLabTinkiffApp
//
//  Created by poskreepta on 07.02.23.
//

import Foundation

struct NewsData: Codable {
    var articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
}
