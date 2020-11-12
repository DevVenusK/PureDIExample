//
//  DetailViewController.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import UIKit

import Pure

class DetailViewController: UIViewController, FactoryModule {
    
    @IBOutlet var avatarImageView: UIImageView!
    
    
    required init(dependency: Dependency, payload: (Payload)) {
        self.imageDownloader = dependency.imageDownloader
        self.imageURL = payload.imageURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    struct Dependency {
        let imageDownloader: ImageDownloaderType
    }
    
    struct Payload {
        let imageURL: String
    }
    
    var imageDownloader: ImageDownloaderType?
    var imageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        guard let url = URL(string: imageURL!) else { return }
        imageDownloader?.image(url, completionHandler: { (image) in
            self.avatarImageView.image = image
        })
    }
}
