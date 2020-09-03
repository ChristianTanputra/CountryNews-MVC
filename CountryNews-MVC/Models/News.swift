//
//  News.swift
//  CountryNews-MVC
//
//  Created by Christian Tanputra on 31/08/20.
//  Copyright © 2020 Christian Tanputra. All rights reserved.
//

import Foundation

struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
