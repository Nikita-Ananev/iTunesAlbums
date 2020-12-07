//
//  Song.swift
//  iTunesAlbums
//
//  Created by Никита Ананьев on 05.12.2020.
//

import Foundation


class Song: Codable {
    let trackId: Int?
    let artistName: String?
    let trackCensoredName: String?
    let artworkUrl100: String?
    
}
class ResponseAlbumDescription: Codable {
    let resultCount: Int
    let results: [Song]
}

