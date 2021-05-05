//
//  NewsViewController+Extension.swift
//  FeedApp
//
//  Created by orpan on 05.05.2021.
//

import Foundation

extension NewsViewController {
    @objc internal func refresh(_ sender: AnyObject) {
        self.currentPage = 1
        self.newsList.removeAll()
        loadData(forNumberOf: currentPage)
        refreshControl.endRefreshing()
        self.tableView.reloadData()
    }
    
    internal func loadData(forNumberOf page: Int){
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
                        self.newsList = self.newsList.uniqued()
                    }
                    RealmHelper.saveObjects(objects: self.newsList)
                    self.tableView.reloadData()
                }
        }
        NewsRepository.shared.fetchNewsList(currentNumberOf: currentPage, onCompletion: anonymousFunction)
    }
    
}

extension Array where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
