//
//  ListPullRequest.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct ListPullRequest: Codable {
    var pullRequests: [PullRequest]?

    private enum CodingKeys: String, CodingKey {
        case pullRequests = ""
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.pullRequests = try? container.decode([PullRequest].self)
    }
}
