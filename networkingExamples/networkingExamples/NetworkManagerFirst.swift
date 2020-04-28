//
//  NetworkManagerFirst.swift
//  networkingExamples
//
//  Created by fedir on 28.04.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation


class NetworkManagerFirst {
    func getAllPosts(_ completionHandler: @escaping ([Post]) -> Void) {
         
               let stringURL = "http://jsonplaceholder.typicode.com/posts"
               if let url = URL(string: stringURL) {
                   URLSession.shared.dataTask(with: url) { (data, responce, error) in
                       
                       if error != nil {
                           print("error in request")
                       }else{
                           if let resp = responce as? HTTPURLResponse , resp.statusCode == 200 ,let responcedata = data {
                               //print(resp.statusCode)
                               print(Thread.current)
                              //print(resp)
                               //print(responcedata)//обьем загруженных данных
                               let posts = try? JSONDecoder().decode([Post].self, from: responcedata)
                          completionHandler(posts ?? [])
                           }
                       }
                   }.resume()
        }
    }
}
