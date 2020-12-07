//
//  ViewController.swift
//  iTunesAlbums
//
//  Created by Никита Ананьев on 04.12.2020.
//

import UIKit

class SearchAlbumViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    let network = NetworkService()
    var searchData = [Album]()
    var albumForTransfer: Album?
    
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.delegate = self
        self.collectionView.keyboardDismissMode = .onDrag
        
        network.getSearchAlbums(search: "") { [weak self] albums in
            self?.searchData = albums
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
        
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as! AlbumCollectionViewCell
        
        let albumPrototype = searchData[indexPath.row]
        

        //all view settings in AlbumCollectionViewCell
        cell.customizeCell(album: albumPrototype, indexPath: indexPath.row)
        return cell
    }
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! AlbumCollectionViewCell
        
        if cell.albumForCell != nil {
            albumForTransfer = cell.albumForCell
            performSegue(withIdentifier: "toAlbumDescription", sender: self)
        }
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        network.getSearchAlbums(search: searchText) { [weak self] albums in
            self?.searchData = albums
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        self.searchBar.endEditing(true)

    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        self.searchBar.resignFirstResponder()
        self.searchBar.endEditing(true)

        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toAlbumDescription" {
            let dest = segue.destination as! AlbumViewController
            dest.albumData = albumForTransfer!

     }
    }



    
    
}

