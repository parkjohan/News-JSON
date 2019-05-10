//
//  ArticleModel.swift
//  News
//
//  Created by Johan Park on 5/7/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
    
    func articlesRetrieved(_ articles: [Articles]) 
}

class ArticleModel {
    
    var delegate: ArticleModelProtocol?
    
    func getArticles() {
        
        let urlString = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=018f69dd3e7f467996bb8bd648d7739e"
        let url = URL(string: urlString)
        
        guard url != nil else { return print("could not load url")}
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // If there are no errors and there is data
            if error == nil && data != nil {
                do {
                    // Decode JSON data into Structs
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Do this on the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(result.articles!)
                    }
                }
                catch {
                    print("Could not decode data. \(error)")
                    return
                }
            }
        }
        dataTask.resume()
    }
}
