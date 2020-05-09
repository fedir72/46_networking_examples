 //
//  SearchResponce.swift
//  networkingExamples
//
//  Created by fedir on 09.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

 struct SearchResponce: Decodable {
    var resultCount: Int
    var  results: [Track]
 }
 
 struct Track: Decodable {
        var trackName: String
        var collectionName: String?
        var artistname: String?
        var artworkUrl60: String?
    }
 
