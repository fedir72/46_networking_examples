//
//  FirstViewController.swift
//  networkingExamples
//
//  Created by fedir on 26.04.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var posts = [Post]() {
        didSet {
            tableview.reloadData()
        }
    }
    
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    var netvorkmanager = NetworkManagerFirst()//экзэмпляр сетевого менеджера
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "FirstPostCell", bundle: nil), forCellReuseIdentifier: "FirstPostCell")
       
    }
    
    @IBAction func DownloadPostbutton(_ sender: UIButton) {
       
        netvorkmanager.getAllPosts { [weak self]  (posts) in
            
            DispatchQueue.main.async {
            self?.textlabel.text = "posts has been downloaded"
                self?.posts = posts
            }
        }
    }
    
}

extension FirstViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = posts[indexPath.row]
        let cell = tableview.dequeueReusableCell(withIdentifier: "FirstPostCell" , for: indexPath) as! FirstPostCell
        cell.titleLabel.text = object.title
        cell.bodyView.text = object.body
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    
}
