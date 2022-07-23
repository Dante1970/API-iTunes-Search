//
//  ViewController.swift
//  iTunes
//
//  Created by Сергей Белоусов on 13.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Result]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.delegate = self
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        data = ApiManager.shared.makeRequest(text: searchText)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data != nil {
            return data!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrackTableViewCell
        
        guard let data = data else { return cell}
        guard let imageURL = URL(string: data[indexPath.row].artworkUrl100!) else { return cell }

        URLSession.shared.dataTask(with: imageURL) { data, _, _ in
            guard let data = data else { return }

            DispatchQueue.main.async {
                cell.imageTrack.image = UIImage(data: data)
            }
        } .resume()
        
        cell.trackName.text = data[indexPath.row].trackName
        cell.artistName.text = data[indexPath.row].artistName
        
        return cell
    }
}
