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
     let  urlAplestr = "https://itunes.apple.com/search?term=jack+johnson&limit=25"
//        request(urlString: urlAplestr) { (searchResponce, error) in
//            searchResponce?.results.map { (track)  in
//                print(track.trackName)
//            }
//        }
        //MARK: - запрос с помощью класса резалт
        request(urlString: urlAplestr) { (result) in
            switch result {
                
            case .success(let searchresponce):
                searchresponce.results.map{ (track) in
                    print("track name: ", track.trackName)
                }
            case .failure(let error):
                print("error", error)
            }
        }
        
    }
    
    //MARK: - функция загрузки данных
    func request(urlString: String,completion: @escaping (Result <SearchResponce,Error>) -> Void) {
          
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                     print("some error ")
                    //completion(nil,error)
                    completion(.failure(error))
                    return
                }
                guard let data =  data else { return }
                //MARK: - конвертация данных в строку
                //let someString = String(data: data, encoding: .utf8)
                //print(someString ?? "no data ")
                
                do {
                let tracks = try JSONDecoder().decode(SearchResponce.self,from: data)
                    //completion(tracks,nil)
                    completion(.success(tracks))
                } catch let jsonError {
                   print("Failed to decode JSOn",jsonError)
                    //completion(nil,error)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
        
        
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
