//
//  ListTableViewCell.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import UIKit

import Pure

class ListTableViewCell: UITableViewCell, ConfiguratorModule {
    
    struct Payload {
        let fullName: String
    }
        
    func configure(dependency: (Dependency), payload: (Payload)) {
        textLabel?.text = payload.fullName
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
