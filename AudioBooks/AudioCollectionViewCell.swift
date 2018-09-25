//
//  AudioCollectionViewCell.swift
//  AudioBooks
//
//  Created by admin on 9/25/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class AudioCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var genresName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var artistImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
