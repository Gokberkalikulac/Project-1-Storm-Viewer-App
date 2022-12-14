//
//  DetailViewController.swift
//  Project-1 Storm Viewer App
//
//  Created by Gökberk Ali Kulaç on 5.11.2022.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedImage : String?
    var selectedIndex : Int?
    var totalImageNumber : Int?

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(selectedIndex!+1) of \(totalImageNumber!)"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }


}
