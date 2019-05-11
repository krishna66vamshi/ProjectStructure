//
//  APIManager.swift
//  ProjectStructure
//
//  Created by vamshi on 06/12/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

//Declare it in constants file
let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/200/explicit.json"


struct APIManager{
    //If resuired
    //FIXME: -Pass Params, Pass Headers,Pass Urls-
    static func fetchData(_success:@escaping([Result]) -> Void,_failure:@escaping(Any) -> Void){
    Alamofire.request(URL(string: urlString)!).responseJSON { (response) in
            if response.result.isSuccess{
                guard let data = response.result.value else{return}
                guard let finalResponse = Mapper<FeedData>().map(JSONObject: data) else{return}
                guard let result = finalResponse.feed?.results else{fatalError()}
                _success(result)
            }
            else{
                _failure("Error")
            }
        }
    }
}

