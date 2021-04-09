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
    let imageView = CustomImageView()
    
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CellViewController {
            cell.configureCell(item: newsList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }
}
