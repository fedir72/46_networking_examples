//
//  FourViewController.swift
//  networkingExamples
//
//  Created by fedir on 09.05.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class FourViewController: UIViewController {
    
    var searchcontroller = UISearchController(searchResultsController: nil)

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     setFortable()
      setForSearchbar()
    }
    
    //MARK: - settings for table and searchbar
    
    private func setForSearchbar() {
        navigationItem.searchController = searchcontroller
        searchcontroller.searchBar.delegate =  self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchcontroller.obscuresBackgroundDuringPresentation = false
    }
   private func setFortable() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension FourViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello user"
        return cell
    }
    
    
}
//MARK: -  methods for searchbar

extension FourViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
