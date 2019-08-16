//
//  RepoOwner.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct RepoOwner: Codable {
    var id: Int64
    var name: String
    var urlImage: String

    private enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case urlImage = "avatar_url"
    }
}
