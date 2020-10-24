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
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func favButtonTapped(_ sender: Any) {
    }
}
