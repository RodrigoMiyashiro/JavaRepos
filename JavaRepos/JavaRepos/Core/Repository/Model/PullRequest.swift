//
//  PullRequest.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct PullRequest: Codable {
    var id: Int64
    var title: String
    var url: String
    var createdAt: String
    var updatedAt: String
    var body: String
    var state: String
    var user: RepoOwner

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case url = "html_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case body
        case state
        case user
    }
}
