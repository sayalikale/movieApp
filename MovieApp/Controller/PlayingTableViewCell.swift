//
//  PlayingTableViewCell.swift
//  MovieApp
//
//  Created by sayali on 24/10/20.
//  Copyright © 2020 sayali. All rights reserved.
//

import UIKit

class PlayingTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImg: UIImageView!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var movietitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        
        // invoke superclass implementation
        super.prepareForReuse()
        // reset (hide) the checkmark label
       // favButton.setImage(UIImage(named: "favorite"), for: .normal)
        
        
        //self.
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func favButtonTapped(_ sender: Any) {
//            let index = IndexPath.init(row: sender.tag, section: 0)
//            print(index.row)
//            let cell = tableView.cellForRow(at: index)
//            if (sender.isSelected)
//            {
//                sender.isSelected = false
//                print("titles[index.row]",titles[index.row])
//                let fluid :Results<movieLocalModel>? = realm.objects(movieLocalModel.self).filter("title = '\((titles[index.row]) ?? "")'")
//
//                if let movieForDeletion = fluid {
//                    do {
//                        try self.realm.write {
//                            self.realm.delete(movieForDeletion)
//                        }
//                    } catch {
//                        print("Error deleting Movie, \(error)")
//                    }
//                }
//
//                sender.setImage(UIImage(named: "favorite"), for: .normal)
//            }
//            else
//            {
//                sender.isSelected = true
//                let newMovie = movieLocalModel()
//                newMovie.title = titles[index.row]
//                newMovie.check = true
//                newMovie.poster_path = baseImage + poster[index.row]
//                self.save(movieLocalmodel: newMovie)
//
//                sender.setImage(UIImage(named: "favoriteSelected"), for: .selected)
//            }
          //  tableView.reloadData()
        
    }
}
