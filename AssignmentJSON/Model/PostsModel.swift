//
//  PostsModel.swift
//  AssignmentJSON
//
//  Created by SAISURAJ on 4/26/22.
//  Copyright © 2022 SAISURAJ. All rights reserved.
//

/*
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
 */

import Foundation

struct PostsModel : Codable {
    let userId : Int?
    let id : Int?
    let title : String?
    let body : String?

    enum CodingKeys: String, CodingKey {

        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        body = try values.decodeIfPresent(String.self, forKey: .body)
    }

}

