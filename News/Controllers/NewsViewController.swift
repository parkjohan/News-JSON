//
//  ViewController.swift
//  News
//
//  Created by Johan Park on 5/7/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = ArticleModel()
    var articles = [Articles]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        model.getArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detail vc" {
            let destVC = segue.destination as! DetailViewController
            let index = tableView.indexPathForSelectedRow
            guard index != nil else {return print("index path not available")}
            let article = articles[index!.row]
            destVC.articleURL = article.url
        }
    }
}

extension NewsViewController: ArticleModelProtocol {
    
    func articlesRetrieved(_ articles: [Articles]) {
        self.articles = articles
        tableView.reloadData()
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "article cell", for: indexPath) as! NewsTableViewCell
        let article = articles[indexPath.row]
        
        cell.displayArticle(article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = articles[indexPath.row]
        print(selectedCell)
        
        // Transition to DetailVC and pass article that was selected
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC")
        //present(detailVC, animated: true, completion: nil)
    }
}

