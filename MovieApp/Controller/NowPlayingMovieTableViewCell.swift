//
//  NowPlayingMovieTableViewCell.swift
//  MovieApp
//
//  Created by sayali on 22/10/20.
//  Copyright © 2020 sayali. All rights reserved.
//

import UIKit

class NowPlayingMovieTableViewCell: UITableViewCell {
    @IBOutlet weak var moviePosterImg: UIImageView!
    
    @IBOutlet weak var movienameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
