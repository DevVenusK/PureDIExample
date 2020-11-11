//
//  ListTableViewCell.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import UIKit

import Pure

class ListTableViewCell: UITableViewCell, ConfiguratorModule {
    
    struct Dependency {
        let imageDownloader: ImageDownloaderType
    }
    
    struct Payload {
        let image: UIImage
    }
    
    var imageDownloader: ImageDownloaderType?
    var cellImage: UIImage?
    
    func configure(dependency: (Dependency), payload: (Payload)) {
        self.imageDownloader = dependency.imageDownloader
        self.cellImage = payload.image
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
