//
//  DetailViewController.swift
//  ProjectStructure
//
//  Created by vamshi on 06/12/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var copyright: UILabel!
    
    var data:Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.sd_setImage(with: URL(string: "\(data?.artworkUrl100 ?? "")"))
        artistName.text = data?.artistName!
        releaseDate.text = data?.releaseDate!
        name.text = data?.name!
        copyright.text = data?.copyright!
        
    }
    
}
