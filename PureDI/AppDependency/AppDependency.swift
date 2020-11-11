//
//  File.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import UIKit

import Pure

struct AppDependency {
    let window: UIWindow
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let networking = Networking()
        let imageDownloader = ImageDownloader()
        let window = UIWindow()
        
        let listTableViewCellConfigurator = ListTableViewCell.Configurator(
            dependency: .init(
                imageDownloader: imageDownloader
            )
        )
        
        let detailViewControllerFactory = DetailViewController.Factory(
            dependency: .init(
                imageDownloader: imageDownloader
            )
        )
        
        window.rootViewController = ListViewController(
            dependency: .init(
                networking: networking,
                detailViewFactory: detailViewControllerFactory,
                listTableViewCellConfigurator: listTableViewCellConfigurator
            )
        )
        
        return AppDependency(
            window: window
        )
    }
}
