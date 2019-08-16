//
//  ListRepositories.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct ListRepositories: Codable {
    var totalCount: Int64
    var incompleteResults: Bool
    var repositories: [Repository]

    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case repositories = "items"
    }
}
