//
//  ArticleService.swift
//  News
//
//  Created by Johan Park on 5/7/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import Foundation

struct ArticleService: Decodable {
    
    var totalResults:Int?
    var articles:[Articles]?
}
