//
//  News.swift
//  FeedApp
//
//  Created by orpan on 09.04.2021.
//

import ObjectMapper
import RealmSwift

@objcMembers class NewsForView : Object {
    dynamic var title: String = ""
    dynamic var newsDescription: String = ""
    dynamic var imageUrl: String = ""
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
    var title, newsDescription, urlToImage: String?
    
    required init? (map: Map){
        
    }
    
    func mapping (map : Map) {
        title <- map["title"]
        newsDescription <- map["description"]
        urlToImage <- map["urlToImage"]
    }
}
