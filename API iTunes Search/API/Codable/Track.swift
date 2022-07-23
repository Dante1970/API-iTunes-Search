//
//  Track.swift
//  API iTunes Search
//
//  Created by Сергей Белоусов on 18.07.2022.
//

import Foundation

// MARK: - Track
struct Track: Codable {
    let resultCount: Int?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let artistName: String?
    let trackName: String?
    let artworkUrl100: String?
}
