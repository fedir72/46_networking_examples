//
//  FirstViewController.swift
//  networkingExamples
//
//  Created by fedir on 26.04.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var textlabel: UILabel!
    
    var dataTask: URLSessionDataTask?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DownloadPostbutton(_ sender: UIButton) {
        
        let stringURL = "https://jsonplaceholder.typicode.com/posts"
        if let url = URL(string: stringURL) {
            dataTask = URLSession.shared.dataTask(with: url) { (data, responce, error) in
                
                if error != nil {
                    print("error in request")
                }else{
                    if let resp = responce as? HTTPURLResponse , resp.statusCode == 200 ,let responcedata = data {
                        //print(resp.statusCode)
                        print(Thread.current)
                       //print(resp)
                        //print(responcedata)//обьем загруженных данных
                        let posts = try? JSONDecoder().decode([Post].self, from: responcedata)
                         print(posts)
                        DispatchQueue.main.async {
                            self.textlabel.text =  "post has been downloaded"
                       }
                        
                       
                    }
                }
            }
            dataTask?.resume()
            
            
            
            
        }
        
    }
    
}
