//
//  SongTableViewCell.swift
//  iTunesAlbums
//
//  Created by Никита Ананьев on 07.12.2020.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var songName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
