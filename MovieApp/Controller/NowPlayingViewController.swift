//
//  NowPlayingViewController.swift
//  MovieApp
//
//  Created by sayali on 22/10/20.
//  Copyright © 2020 sayali. All rights reserved.
//

import UIKit
import RealmSwift

class NowPlayingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var moviemanager = movieManager()
    var poster = [String]()
    var titles = [String]()
    var baseImage = "https://image.tmdb.org/t/p/h100"
    var bRec:Bool = false
    let realm = try! Realm()
    var movieLocalmodel: Results<movieLocalModel>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
        loadMoviedata()
    }
    
    func fetchMovies()
    {
        moviemanager.fetchWeather() { [weak self] (result) in
            guard let this = self else { return }
            this.handleResult(result)
        }
    }
    
    private func handleResult(_ result: Result<movieModel, Error>) {
        switch result {
        case .success(let model):
            //print(model.results)
            for mo in model.results
            {
                let temp = mo.title.replacingOccurrences(of: "\'", with: "", options: NSString.CompareOptions.literal, range:nil)
                poster.append(mo.poster_path)
                titles.append(temp)
                tableView.reloadData()
            }
        case .failure(let error):
            print(error)
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let index = IndexPath.init(row: sender.tag, section: 0)
        print(index.row)
        // let cell = tableView.cellForRow(at: index)
        if (sender.isSelected)
        {
            sender.isSelected = false
            print("titles[index.row]",titles[index.row])
            let favMovie :Results<movieLocalModel>? = realm.objects(movieLocalModel.self).filter("title = '\((titles[index.row]))'")
            
            if let movieForDeletion = favMovie {
                do {
                    try self.realm.write {
                        self.realm.delete(movieForDeletion)
                    }
                } catch {
                    print("Error deleting Movie, \(error)")
                }
            }
            sender.setImage(UIImage(named: "favorite"), for: .normal)
        }
        else
        {
            sender.isSelected = true
            let newMovie = movieLocalModel()
            newMovie.title = titles[index.row]
            newMovie.check = true
            newMovie.poster_path = baseImage + poster[index.row]
            self.save(movieLocalmodel: newMovie)
            sender.setImage(UIImage(named: "favoriteSelected"), for: .selected)
        }
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
    }
    
    func loadMoviedata() {
        movieLocalmodel  = realm.objects(movieLocalModel.self)
    }
}


extension NowPlayingViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayingTableViewCell", for: indexPath) as! PlayingTableViewCell
        
        cell.movietitle?.numberOfLines = 0
        let url = URL(string: baseImage + poster[indexPath.row])!
        
        // Fetch Image Data
        if let data = try? Data(contentsOf: url) {
            cell.posterImg?.image = UIImage(data: data)
        }
        
        cell.movietitle?.text = titles[indexPath.row]
        
        let favMovie :Results<movieLocalModel>? = realm.objects(movieLocalModel.self).filter("title = '\(cell.movietitle?.text ?? "")'")
        
        if (favMovie != nil) && (favMovie?.count ?? 0 != 0) && (cell.movietitle?.text ?? "" == titles[indexPath.row]) {
            cell.favButton.isSelected = true
            cell.favButton.setImage(UIImage(named: "favoriteSelected"), for: .selected)
        } else {
            cell.favButton.isSelected = false
            cell.favButton.setImage(UIImage(named: "favorite"), for: .normal)
        }
        
        cell.favButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return cell
    }
}

