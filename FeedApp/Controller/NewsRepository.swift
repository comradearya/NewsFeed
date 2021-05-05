//
//  NewsRepository.swift
//  FeedApp
//
//  Created by orpan on 09.04.2021.
//

import Alamofire
import AlamofireObjectMapper
import RealmSwift

final class NewsRepository {
    //MARK:- Properties
    
    static let shared = NewsRepository()
    private var news: [News] = []
    
    //MARK:- Private Methods
    
    private func stringUrl(forNumberOf page: Int) -> String {
        let stringUrl = "https://newsapi.org/v2/top-headlines?country=ua&sortBy=publishedAt&apiKey=82b9abc56a004cafb08fb6c02d8ebfbb&page=\(page)"
        return stringUrl
    }
    
    //MARK:- API Methods
    
    func fetchNewsList(currentNumberOf page: Int, onCompletion: @escaping ([News]) -> ()) {
        guard let url = URL(string: stringUrl(forNumberOf: page)) else { return }
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding(destination: .queryString), headers: nil).responseObject { (response: DataResponse<ResponseRequest>) in
            switch(response.result){
            case .success(_):
                if let resultNews = response.result.value?.articles {
                    self.news = resultNews
                    onCompletion(self.news)
                }
            case .failure(_):
                onCompletion(self.news)
            }
        }
    }
}
