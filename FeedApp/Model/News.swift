//
//  News.swift
//  FeedApp
//
//  Created by orpan on 09.04.2021.
//

import ObjectMapper

struct NewsForView {
    let title: String
    let description: String
    let imageUrl: String
}

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
        title <- map["title"]
        newsDescription <- map["description"]
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
