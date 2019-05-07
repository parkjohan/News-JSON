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
        // Fires off request to retrieve API
        
        // When it returns, parse the JSON and send results back
        delegate?.articlesRetrieved([Articles]())
    }
}
