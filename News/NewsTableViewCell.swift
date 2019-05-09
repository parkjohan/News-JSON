//
//  NewsTableViewCell.swift
//  News
//
//  Created by Johan Park on 5/7/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay: Articles?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func displayArticle(_ article: Articles) {
        
        articleToDisplay = article
        articleTitleLabel.text = articleToDisplay?.title!
        
        let urlString = (articleToDisplay?.urlToImage)!
        let url = URL(string: urlString)
        
        // Get the session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check for errors
            if error == nil && data != nil {
                
                // Set imageView with data
                DispatchQueue.main.async {
                    self.articleImageView.image = UIImage(data: data!)
                }
            }
        }
        dataTask.resume()
    }
}
