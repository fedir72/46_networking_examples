//
//  Post.swift
//  networkingExamples
//
//  Created by fedir on 27.04.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

class Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(userId: Int,title: String,body: String) {
        self.userId = userId
        self.body = body
        self.title = title
        self.id = 0
    }
}
