//
//  ItunesModel.swift
//  ProjectStructure
//
//  Created by vamshi on 06/12/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import Foundation
import ObjectMapper

struct FeedData:Mappable{
    var feed : Feed?
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        feed <- map["feed"]
    }
}
struct Feed:Mappable {
    var author : Author?
    var copyright : String?
    var country : String?
    var icon : String?
    var id : String?
    var links : [Link]?
    var results : [Result]?
    var title : String?
    var updated : String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        author <- map["author"]
        copyright <- map["copyright"]
        country <- map["country"]
        icon <- map["icon"]
        id <- map["id"]
        links <- map["links"]
        results <- map["results"]
        title <- map["title"]
        updated <- map["updated"]
    }
}
struct Result:Mappable {
    
    var artistId : String?
    var artistName : String?
    var artistUrl : String?
    var artworkUrl100 : String?
    var contentAdvisoryRating : String?
    var copyright : String?
    var genres : [Genre]?
    var id : String?
    var kind : String?
    var name : String?
    var releaseDate : String?
    var url : String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        artistId <- map["artistId"]
        artistName <- map["artistName"]
        artistUrl <- map["artistUrl"]
        artworkUrl100 <- map["artworkUrl100"]
        contentAdvisoryRating <- map["contentAdvisoryRating"]
        copyright <- map["copyright"]
        genres <- map["genres"]
        id <- map["id"]
        kind <- map["kind"]
        name <- map["name"]
        releaseDate <- map["releaseDate"]
        url <- map["url"]
    }
}
struct Genre:Mappable {
    
    var genreId : String?
    var name : String?
    var url : String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        genreId <- map["genreId"]
        name <- map["name"]
        url <- map["url"]
    }
}

struct Link:Mappable {
    var alternate : String?
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        alternate <- map["alternate"]
    }
}

struct Author:Mappable {
    var name : String?
    var uri : String?
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        name <- map["name"]
        uri <- map["uri"]
        
        
        
    }
}

//FIXME: -ALTERNATE feed.title etc...-

/*
 
 struct ItunesModel: Mappable {
 
 var title:String?
 var country:String?
 var name:String?
 var uri:String?
 var results:[results]?
 
 init?(map: Map) {
 }
 
 mutating func mapping(map: Map) {
 title <- map["feed.title"]
 country <- map["feed.country"]
 name <- map["feed.author.name"]
 uri <- map["feed.author.uri"]
 results <- map["feed.results"]
 
 }
 
 }
 
 struct results:Mappable {
 var artistName:String?
 var kind:String?
 var artworkUrl100:String?
 
 init?(map: Map) {
 }
 
 mutating func mapping(map: Map) {
 artistName <- map["artistName"]
 kind <- map["kind"]
 artworkUrl100 <- map["artworkUrl100"]
 }
 
 
 }
 
 */




