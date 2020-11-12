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
        let networking: NetworkingType = Networking()
        let imageDownloader: ImageDownloaderType = ImageDownloader()
        let window = UIWindow()
        
        let listTableViewCellConfigurator = ListTableViewCell.Configurator()
        
        let detailViewControllerFactory = DetailViewController.Factory(
            dependency: .init(
                storyboard: UIStoryboard.init(name: "Main", bundle: nil),
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
