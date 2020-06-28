//
//  CitizenModel.swift
//  HelloDongsup
//
//  Created by Jiyoung Park on 2020/06/28.
//  Copyright © 2020 d2fault. All rights reserved.
//

import Foundation

struct CitizenModel: Codable {
    let data: Data
}

struct Data: Codable {
    let citizens: [Citizens]
}

struct Citizens: Codable {
    let name: String
    let imageUrl: String
    let catchphrase: String?
}
