//
//  NewsViewController+Extension.swift
//  FeedApp
//
//  Created by orpan on 05.05.2021.
//

import Foundation

extension NewsViewController {
    @objc internal func refresh(_ sender: AnyObject) {
        loadData()
        refreshControl.endRefreshing()
        self.tableView.reloadData()
    }
    
    internal func loadData(){
        let anonymousFunction = { (fetchedNewsList: [News]) in
                if fetchedNewsList.isEmpty {
                    let lastNewsForViewList = RealmHelper.getObjects()
                    self.newsList = lastNewsForViewList
                    self.tableView.reloadData()
                }
                else {
                    for news in fetchedNewsList {
                        let newsForView = NewsForView()
                        newsForView.imageUrl = news.urlToImage ?? ""
                        newsForView.newsDescription = news.newsDescription ?? ""
                        newsForView.title = news.title ?? ""
                        self.newsList.append(newsForView)
                    }
                    RealmHelper.saveObjects(objects: self.newsList)
                    self.tableView.reloadData()
                }
        }
        NewsRepository.shared.fetchNewsList(onCompletion: anonymousFunction)
    }
    
}
