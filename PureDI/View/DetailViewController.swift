//
//  DetailViewController.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import UIKit

import Pure

class DetailViewController: UIViewController, FactoryModule {
    required init(dependency: Dependency, payload: (Payload)) {
        self.imageDownloader = dependency.imageDownloader
        self.id = payload.id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    struct Dependency {
        let imageDownloader: ImageDownloaderType
    }
    
    struct Payload {
        let id: Int
    }
    
    var imageDownloader: ImageDownloaderType?
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        print(id)
    }
}
