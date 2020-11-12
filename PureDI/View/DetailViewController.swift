//
//  DetailViewController.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import UIKit

import Pure

class DetailViewController: UIViewController, FactoryModule {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    required init(dependency: Dependency, payload: (Payload)) {
        self.imageDownloader = dependency.imageDownloader
        self.imageURL = payload.imageURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    struct Dependency {
        let storyboard: UIStoryboard
        let imageDownloader: ImageDownloaderType
    }
    
    struct Payload {
        let imageURL: String
    }
    
    var imageDownloader: ImageDownloaderType?
    var imageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: imageURL!) else { return }
        imageDownloader?.image(url, completionHandler: { (image) in
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        })
    }
}

// For Storyboard
extension Factory where Module == DetailViewController {
    func create(payload: DetailViewController.Payload) -> DetailViewController {
        let module = self.dependency.storyboard.instantiateViewController(identifier: "DetailViewController") as! Module
        module.imageDownloader = dependency.imageDownloader
        module.imageURL = payload.imageURL
        return module
    }
}
