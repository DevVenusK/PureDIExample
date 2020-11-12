//
//  RemoteNotificationService.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import UIKit

protocol ImageDownloaderType {
    func image(_ url: URL, completionHandler: @escaping ((UIImage) -> Void))
}

final class ImageDownloader: ImageDownloaderType {
    let session = URLSession.shared
    func image(_ url: URL, completionHandler: @escaping ((UIImage) -> Void)) {
        let task = session.dataTask(with: url) {
            data, response, error in
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            completionHandler(image)
        }
        task.resume()
    }
}
