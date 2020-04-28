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
    
    var netvorkmanager = NetworkManagerFirst()//экзэмпляр сетевого менеджера
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func DownloadPostbutton(_ sender: UIButton) {
       
        netvorkmanager.getAllPosts { [weak self]  (posts) in
            
            DispatchQueue.main.async {
            self?.textlabel.text = "posts has been downloaded"
            }
        }
    }
    
}
