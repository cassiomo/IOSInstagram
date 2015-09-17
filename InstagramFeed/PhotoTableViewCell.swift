//
//  PhotoTableViewCell.swift
//  InstagramFeed
//
//  Created by Mo, Kevin on 7/25/15.
//  Copyright (c) 2015 Mo, Kevin. All rights reserved.
//

import UIKit


class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnuailImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
