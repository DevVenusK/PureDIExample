//
//  Networking.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import UIKit

protocol NetworkingType {
    func reqeust<T: Codable>(url: URL, data: T.Type, completionHandler: @escaping ((T) -> Void)) 
}

final class Networking: NetworkingType {
    let session = URLSession.shared
    func reqeust<T: Codable>(url: URL, data: T.Type,completionHandler: @escaping ((T) -> Void)) {
        let task = session.dataTask(with: url) { data, response, error in
            let deocde = try? JSONDecoder().decode(T.self, from: data!)
            completionHandler(deocde!)
        }
        task.resume()
    }
}

struct Repositories: Codable {
    let items: [Items]
}

struct Items: Codable {
    let fullName: String?
    let owner: Owner?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case owner
    }
}

struct Owner: Codable {
    let avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }
}
