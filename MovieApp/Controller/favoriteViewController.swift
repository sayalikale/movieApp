//
//  SecondViewController.swift
//  MovieApp
//
//  Created by sayali on 22/10/20.
//  Copyright © 2020 sayali. All rights reserved.


import UIKit
import RealmSwift

class favoriteViewController: UIViewController  {
    
    let realm = try! Realm()
    
    var movieLocalmodel: Results<movieLocalModel>?
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMoviedata()
        tableview.reloadData()
    }
    
    //MARK: - Data Manipulation Methods
    
    func save(movieLocalmodel: movieLocalModel) {
        do {
            try realm.write {
                realm.add(movieLocalmodel)
            }
        } catch {
            print("Error saving category \(error)")
        }
        tableview.reloadData()
    }
    
    func loadMoviedata() {
        movieLocalmodel  = realm.objects(movieLocalModel.self)
        tableview.reloadData()
    }
}

//MARK: - Tableview Delegate, DataSource
extension favoriteViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieLocalmodel?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NowPlayingMovieTableViewCell", for: indexPath)
        
        if let moviedetails = movieLocalmodel?[indexPath.row] {
            
            cell.textLabel?.text = moviedetails.title
            
            let url = URL(string: moviedetails.poster_path)
            if let data = try? Data(contentsOf: url!) {
                cell.imageView?.image = UIImage(data: data)
            }
        }
        return cell
    }
}
