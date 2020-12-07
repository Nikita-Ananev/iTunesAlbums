//
//  Album.swift
//  iTunesAlbums
//
//  Created by Никита Ананьев on 04.12.2020.
//

import Foundation

class Album: Codable {
    let artistId: Int
    let collectionId: Int
    let artistName: String
    let collectionName: String
    let artworkUrl100: String
    let trackCount: Int?
    let copyright: String?
    let primaryGenreName: String?
    
}
class ResponseAlbumArray: Codable {
    let resultCount: Int
    let results: [Album]
}

//{
// "resultCount":50,
// "results": [
//{"wrapperType":"collection", "collectionType":"Album", "artistId":282544261, "collectionId":282544260, "amgArtistId":2018024, "artistName":"Close Enough", "collectionName":"Noize", "collectionCensoredName":"Noize", "artistViewUrl":"https://music.apple.com/us/artist/close-enough/282544261?uo=4", "collectionViewUrl":"https://music.apple.com/us/album/noize/282544260?uo=4", "artworkUrl60":"https://is2-ssl.mzstatic.com/image/thumb/Music123/v4/d3/4e/37/d34e3775-9a3e-90f3-5be0-5cc757815ee9/source/60x60bb.jpg", "artworkUrl100":"https://is2-ssl.mzstatic.com/image/thumb/Music123/v4/d3/4e/37/d34e3775-9a3e-90f3-5be0-5cc757815ee9/source/100x100bb.jpg", "collectionPrice":9.99, "collectionExplicitness":"explicit", "contentAdvisoryRating":"Explicit", "trackCount":14, "copyright":"℗ 2008 Close Enough", "country":"USA", "currency":"USD", "releaseDate":"2008-01-01T08:00:00Z", "primaryGenreName":"Reggae"},
