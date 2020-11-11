//
//  AppDependency.swift
//  PureDI
//
//  Created by MAXST on 2020/11/11.
//

import Foundation

struct Dependency {
  let networking: Networking
  init(networking: Networking) {
    self.networking = networking
  }
}

struct Payload {
  let id: Int
  init(id: Int) {
    self.id = id
  }
}
