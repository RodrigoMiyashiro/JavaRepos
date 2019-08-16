//
//  Repository.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct Repository: Codable {
    var id: Int64
    var name: String
    var description: String
    var stargazersCount: Int64
    var forksCount: Int64
    var owner: RepoOwner

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case stargazersCount = "stargazers_count"
        case forksCount = "forks"
        case owner
    }
}
