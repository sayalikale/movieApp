//
//  SecondViewController.swift
//  MovieApp
//
//  Created by sayali on 22/10/20.
//  Copyright © 2020 sayali. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     
    //tableview
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 4
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NowPlayingMovieTableViewCell", for: indexPath)
            cell.textLabel?.text = "sayali"
            cell.imageView?.image = image(UIImage(named: "star")!, withSize: CGSize(width: 30, height: 30))
            return cell
        }
        
        func image( _ image:UIImage, withSize newSize:CGSize) -> UIImage
        {
            UIGraphicsBeginImageContext(newSize)
            image.draw(in: CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage!.withRenderingMode(.automatic)
        }
    }

