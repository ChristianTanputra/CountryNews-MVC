//
//  PullData.swift
//  CountryNews-MVC
//
//  Created by Christian Tanputra on 31/08/20.
//  Copyright © 2020 Christian Tanputra. All rights reserved.
//

import Foundation

class PullData: NSObject {
    
    static let shared = PullData()
    var newsArticles = [Article]()
    
    func fetchAPI(completion: @escaping (News?, Error?) -> ()) {
        let countryCode = "id" // Change this to country code based on your liking
        let apiKey = "R E P L A C E T H I S" // Change this to your API Key that you can easily get by signing up on newsapi.org
        let urlString = "https://newsapi.org/v2/top-headlines?country=\(countryCode)&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            // Check response
            guard let data = data else { return }
            do {
                let news = try JSONDecoder().decode(News.self, from: data)
                print(news)
                DispatchQueue.main.async {
                    completion(news, nil)
                }
            } catch let jsonErr {
                print("Failed to decode: ", jsonErr)
            }
        }.resume()
    }
}
