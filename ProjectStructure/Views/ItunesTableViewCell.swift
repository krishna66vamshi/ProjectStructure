//
//  ItunesTableViewCell.swift
//  ProjectStructure
//
//  Created by vamshi on 06/12/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import UIKit
import SDWebImage

class ItunesTableViewCell: UITableViewCell {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    func configureCell(with data:Result){
        
        spinner.startAnimating()
        img.sd_setImage(with: URL(string: "\(data.artworkUrl100 ?? "")"))
        lbl1.text = data.artistName!
        lbl2.text = data.kind!
        spinner.stopAnimating()
    }
    
}
