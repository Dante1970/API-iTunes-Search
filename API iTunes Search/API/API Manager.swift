//
//  API Manager.swift
//  API iTunes Search
//
//  Created by Сергей Белоусов on 18.07.2022.
//

import Foundation
import UIKit

class ApiManager {
    
    static let shared = ApiManager()
    
    private let baseUrl = "https://itunes.apple.com/search?limit=30&term="
    private var results: [Result]? = nil

    func makeRequest(text: String) -> [Result]? {
        
        let converteText = converteText(text)
        let url = baseUrl + converteText
        let request = URLRequest(url: URL(string: url)!)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else { return }
            guard error == nil else { return }

            do {
                let track = try JSONDecoder().decode(Track.self, from: data)
                self.results = track.results
            } catch let error {
                print("ERROR - \(error)")
            }
        }.resume()

        return results
    }
    
    private func converteText(_ text: String) -> String {
        text.components(separatedBy: " ")
            .filter { !$0.isEmpty }
            .joined(separator: "+")
    }
}
