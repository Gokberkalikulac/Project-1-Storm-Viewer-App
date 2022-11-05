//
//  ViewController.swift
//  Project-1 Storm Viewer App
//
//  Created by Gökberk Ali Kulaç on 5.11.2022.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer App"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fileManeger = FileManager.default
        let filesPath = Bundle.main.resourcePath!
        let items = try! fileManeger.contentsOfDirectory(atPath: filesPath)
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Pictures",for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

