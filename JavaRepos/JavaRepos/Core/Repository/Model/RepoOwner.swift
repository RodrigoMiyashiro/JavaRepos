//
//  RepoOwner.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct RepoOwner: Codable {
    var identifier: Int64
    var name: String
    var urlImage: String

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "login"
        case urlImage = "avatar_url"
    }
}
