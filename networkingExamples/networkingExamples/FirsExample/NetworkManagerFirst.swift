//
//  NetworkManagerFirst.swift
//  networkingExamples
//
//  Created by fedir on 28.04.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation


class NetworkManagerFirst {
    
   //MARK: - определение метода запроса в сеть как енум
    
    enum HTTPMethod: String {
        case POST
        case PUT
        case GET
        case DELETE
    }
    
    //MARK: - апишки для обращения по разным адресам для добавления к основному апи
    
    enum APIs: String {
        case posts
        case users
        case comments
    }
    
     
    
    
    private var baceUrl = "http://jsonplaceholder.typicode.com/"
    
    
    func getAllPosts(_ completionHandler: @escaping ([Post]) -> Void) {
         
               //let stringURL = "http://jsonplaceholder.typicode.com/posts"
        if let url = URL(string: baceUrl + APIs.posts.rawValue) {
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
    
    
    //MARK: - постметод создание обьекта на сервере
    
    func postCreatePost(_ post: Post, completionHandler: @escaping () -> Void) {
//
//        let sendData = try? JSONEncoder().encode(post)
//
//        guard let url = URL(string: baceUrl  + APIs.posts.rawValue) , let data = sendData else {return}
//
//        var request = URLRequest(url: url)
//        request.httpMethod = HTTPMethod.POST.rawValue //определяем метод запроса как создать значение
//        request.httpBody = data// данные для передачи на сервер в теле запроса
//        //добавка хедеров в урлзапрос для конкретизации
//        request.setValue("\(data.count)" , forHTTPHeaderField: "Content-Lengh")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request as URLRequest) {(data, responce, error) in
//            if error != nil {
//                print("error")
//            } else if let resp = responce as? HTTPURLResponse , resp.statusCode == 201 , let responcedata = data {
//                let json = try? JSONSerialization.jsonObject(with: responcedata)
//                print(json)
//
//                if let responsedPost = try? JSONDecoder().decode(Post.self, from: responcedata) {
//                completionHandler(responsedPost)
//                }
//
//            }
//        }.resume()
        
    }
}
