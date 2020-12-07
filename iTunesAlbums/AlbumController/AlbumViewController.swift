//
//  AlbumViewController.swift
//  iTunesAlbums
//
//  Created by Никита Ананьев on 05.12.2020.
//

import UIKit


class AlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var albumPhoto: UIImageView!
    @IBOutlet weak var albumBackground: UIView!

    @IBOutlet weak var tableView: UITableView!
    //labels
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var trackCountLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    let network = NetworkService()
    var albumData: Album?
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let album = albumData {
            network.getAlbumDescription(almbumId: album.collectionId, completion: { [weak self] songs in
                self?.songs = songs
                self?.songs.removeFirst()
               
                DispatchQueue.main.async {
                    
                    self?.setupAlbumController(album:album)
                    self?.tableView.reloadData()
                }
                
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell", for: indexPath) as! SongTableViewCell
        
        cell.alpha = 0
        UIView.animate(
            withDuration: 0.8,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1

        })
        
        
        let songPrototype = songs[indexPath.row]
        
        cell.songName.text = songPrototype.trackCensoredName
        cell.artistName.text = songPrototype.artistName
        if let url = URL(string: songPrototype.artworkUrl100!){
            cell.songImage.load(url: url)
        }
        tableView.layoutSubviews()
        
        return cell
    }
    
    
    
    func setupAlbumController(album: Album) {
        albumNameLabel.text = album.collectionName
        artistNameLabel.text = album.artistName
        genreLabel.text  = album.primaryGenreName
        trackCountLabel.text = "Track count: " + String(album.trackCount ?? 0)
        copyrightLabel.text = String(album.copyright ?? "")
        
        if let url = URL(string: album.artworkUrl100){
            albumPhoto.load(url: url)
        }
    
        albumPhoto.layer.borderWidth = 0.5
        albumPhoto.layer.borderColor = .init(red: 0.1, green: 0.3, blue: 0.2, alpha: 0.4)
        albumPhoto.layer.cornerRadius = 10
        
        albumBackground.layer.cornerRadius = 10
        albumBackground.layer.borderWidth = 0.5
        albumBackground.layer.borderColor = .init(red: 0.1, green: 0.3, blue: 0.2, alpha: 0.4)
        
        

    }
    

}
