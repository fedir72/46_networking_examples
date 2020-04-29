//
//  SecondViewController.swift
//  networkingExamples
//
//  Created by fedir on 26.04.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }
    


}

extension SecondViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
    }
}

