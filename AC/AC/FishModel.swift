//
//  FishModel.swift
//  AC
//
//  Created by Jiyoung Park on 2020/06/22.
//  Copyright © 2020 d2fault. All rights reserved.
//

import Foundation

// type을 임의로 만들어 주고
// 이름은 모르지만 String이 먼저 오고, 그 뒤에 오는 모델이 Fish라는 뜻
// 참고: http://acnhapi.com/v1/fish
typealias FishModel = [String: Fish]

struct Fish: Codable {
    let id: Int
    let name: [String: String]
    let price: Int
    let imageURI: String
    let museumPhrase: String
    
    // 다른 id로 커스텀하여 사용하고 싶을 때 다음과 같이 정의
    enum CodingKeys: String, CodingKey {
        case id, name, price
        case imageURI = "image_uri"
        case museumPhrase = "museum-phrase"
    }
}

// Codable -> encode/decode를 쉽게 적용할 수 있도록 만들어 준 것
//struct FishModel: Codable {
//    // class vs struct
//    // class -> reference 객체
//    // struct -> 값 객체, 단점: 느리다 / 장점: thread safe하다.
//    let bitterling: [Fish]
//}
