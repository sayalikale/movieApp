//
//  FirstViewController.swift
//  MovieApp
//
//  Created by sayali on 22/10/20.
//  Copyright © 2020 sayali. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var moviemanager = movieManager()
    var poster = [String]()
    var titles = [String]()
    var baseImage = "https://image.tmdb.org/t/p/h100"
    var bRec:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
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
            print(model.results)
            for mo in model.results
            {
                print(mo)
                poster.append(mo.poster_path)
                titles.append(mo.title)
                tableView.reloadData()
            }
        case .failure(let error):
            print(error)
        }
    }
    
    
    //tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NowPlayingMovieTableViewCell", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        let url = URL(string: baseImage + poster[indexPath.row])!
        print(url)
        // Fetch Image Data
        if let data = try? Data(contentsOf: url) {
            cell.imageView?.image = UIImage(data: data)
        }
        
        let button = UIButton()
        button.frame = CGRect(x: self.view.frame.size.width - 70, y: 30, width: 50, height: 50)
        button.setImage(UIImage(named: "star"), for: .normal)
        button.setTitle("Name your Button ", for: .normal)
        button.setImage(UIImage(named: "favorite"), for: .normal)
        button.setImage(UIImage(named: "favoriteSelected"), for: .selected)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        cell.addSubview(button)
        return cell
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        if (sender.isSelected)
        {
            sender.isSelected = false
        }
        else
        {
            sender.isSelected = true
        }
    }
    
    func images( _ image:UIImage, withSize newSize:CGSize) -> UIImage
    {
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!.withRenderingMode(.automatic)
    }
}


