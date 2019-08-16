//
//  PullRequestsProvider.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol PullRequestsProvider: AnyObject {
    func pullRequests(ownerName: String, repositoryName: String, page: Int) throws -> ListPullRequest?
}
