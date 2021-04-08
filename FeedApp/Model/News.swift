//
//  News.swift
//  FeedApp
//
//  Created by orpan on 08.04.2021.
//

import ObjectMapper

class ResponseRequest: Mappable {
    var articles: [News]?
     
    required init? (map: Map){
        
    }
    
    func mapping (map: Map) {
          articles <- map["articles"]
      }
}

class News: Mappable {
    var source: Source?
    var title, newsDescription: String?
    var url, urlToImage, content: String?
    
    required init? (map: Map){
        
    }
    
    func mapping (map : Map) {
      
        source <- map["source"]
        /*if let publishedAtString = try map.from("publishedAt") {
            publishedAt = utcDateFormatter.date(from: String(publishedAtString.prefix(19) + "Z"))!
        }
        else {
            publishedAt = try! map.from("publishedAt")
        }
 */
        title <- map["title"]
        newsDescription <- map["newsDescription"]
        url <- map["url"]
        content <- map["content"]
        urlToImage <- map["urlToImage"]
    }
}

class Source : Mappable {
    var name: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}

let utcDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return dateFormatter
}()
