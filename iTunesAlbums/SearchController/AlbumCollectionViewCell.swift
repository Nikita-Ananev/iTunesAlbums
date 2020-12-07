//
//  AlbumCollectionViewCell.swift
//  iTunesAlbums
//
//  Created by Никита Ананьев on 04.12.2020.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var albumPhoto: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    var albumForCell: Album?
    
    
    //set cell configuration
    func customizeCell(album: Album, indexPath: Int) {
        albumForCell = album
        contentView.alpha = 0
        UIView.animate(
            withDuration: 0.8,
            delay: 0.1 * Double(indexPath),
            animations: {
                self.contentView.alpha = 1

        })
        
        
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = .init(red: 0.1, green: 0.3, blue: 0.2, alpha: 0.4)
        self.contentView.layer.cornerRadius = 10
        
        
        albumName.text = album.collectionName
        artistName.text = album.artistName
        
        albumName.backgroundColor = #colorLiteral(red: 1, green: 0.981313169, blue: 0.9913397431, alpha: 0.800961359)
        albumName.layer.cornerRadius = 3
        albumName.layer.masksToBounds = true
        
        artistName.backgroundColor = #colorLiteral(red: 1, green: 0.981313169, blue: 0.9913397431, alpha: 0.800961359)
        artistName.layer.cornerRadius = 3
        artistName.layer.masksToBounds = true
        layoutIfNeeded()
        
        if let url = URL(string: album.artworkUrl100){
            albumPhoto.load(url: url)
        }
        
        
        
        
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
