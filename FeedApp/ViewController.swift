//
//  ViewController.swift
//  FeedApp
//
//  Created by orpan on 08.04.2021.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    let identifier = "cell"
    
    var newsList = [NewsForView] ()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let anonymousFunction = { (fetchedNewsList: [News]) in
            DispatchQueue.main.async {
                let newsForViewList = fetchedNewsList.map { news in
                    return NewsForView(
                        title: news.title ?? "",
                        description: news.newsDescription ?? "" ,
                        imageUrl: news.urlToImage ?? "" )
                }
                self.newsList = newsForViewList
                self.tableView.reloadData()
            }
        }
        NewsRepository.shared.fetchNewsList(onCompletion: anonymousFunction)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as UITableViewCell
        
        let news = newsList[indexPath.row]
        
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        
        cell.textLabel?.text = news.title
        cell.detailTextLabel?.text = news.description
        if let url = URL(string: news.imageUrl){
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
