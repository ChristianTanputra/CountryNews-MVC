//
//  File.swift
//  CountryNews-MVC
//
//  Created by Christian Tanputra on 03/09/20.
//  Copyright © 2020 Christian Tanputra. All rights reserved.
//

import Foundation


struct Article: Decodable {
    let source: Source
    let author, title, articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}
