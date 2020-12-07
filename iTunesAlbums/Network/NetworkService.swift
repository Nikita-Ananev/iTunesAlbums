//
//  NetworkService.swift
//  iTunesAlbums
//
//  Created by Никита Ананьев on 04.12.2020.
//

import Foundation

class NetworkService {
    let session = URLSession.shared

    func getSearchAlbums(search text: String, completion: @escaping ([Album]) -> Void ) {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = "/search"
        components.queryItems = [
            URLQueryItem(name: "term", value: text),
            URLQueryItem(name: "entity", value: "album"),
            URLQueryItem(name: "attribute", value: "albumTerm"),
            URLQueryItem(name: "limit", value: "30")
        ]
        guard let url = components.url else { return }
        
        let task = URLSession.shared.dataTask(with: url ) { data, response, error in
            if error != nil {
                    return
                }
            if let data = data {
            let jsonDecoder = JSONDecoder()
            do {
                let parsedJSON = try jsonDecoder.decode(ResponseAlbumArray.self, from: data)
                
                let albums = parsedJSON.results.sorted{ $0.collectionName.lowercased() < $1.collectionName.lowercased() }
                
                completion(albums)
                    } catch {
            print(error)
                    }
                   }
               }
        task.resume()
    }
    
    func getAlbumDescription(almbumId: Int, completion: @escaping ([Song]) -> Void ) {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = "/lookup"
        components.queryItems = [
            URLQueryItem(name: "id", value: String(almbumId)),
            URLQueryItem(name: "entity", value: "song"),
        ]
        guard let url = components.url else { return }
        
        let task = URLSession.shared.dataTask(with: url ) { data, response, error in
            if error != nil {
                    return
                }
            if let data = data {
            let jsonDecoder = JSONDecoder()
            do {
                let parsedJSON = try jsonDecoder.decode(ResponseAlbumDescription.self, from: data)
                
                let songs = parsedJSON.results
                
                
                completion(songs)
                    } catch {
            print(error)
                    }
                   }
               }
        task.resume()
    }

    
}
