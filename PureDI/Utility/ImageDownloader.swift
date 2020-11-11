//
//  RemoteNotificationService.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import Foundation

protocol ImageDownloaderType {
    func image()
}

final class ImageDownloader: ImageDownloaderType {
    func image() { }
}
