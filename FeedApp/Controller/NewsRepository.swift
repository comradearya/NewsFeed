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
    var news: [News] = []
    
    //MARK:- Private Methods
    
    private func stringUrl() -> String {
        let date = Date()
        let currentDate = formatter.string(from: date)
        let stringUrl = "https://newsapi.org/v2/top-headlines?country=ua&from=\(currentDate)&sortBy=publishedAt&apiKey=82b9abc56a004cafb08fb6c02d8ebfbb"
        
        return stringUrl
    }
    
    //MARK:- API Methods
    
    func fetchNewsList(onCompletion: @escaping ([News]) -> ()) {
        guard let url = URL(string: stringUrl()) else { return }
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

//MARK:- Helper
let formatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter
}()
