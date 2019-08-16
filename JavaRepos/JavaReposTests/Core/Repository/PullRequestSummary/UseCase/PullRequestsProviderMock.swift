//
//  PullRequestsProviderMock.swift
//  JavaReposTests
//
//  Created by Rodrigo Miyashiro on 12/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class PullRequestsProviderMock: PullRequestsProvider {
    var callsToAvailablePullRequestsSummary = 0

    func pullRequests(ownerName: String, repositoryName: String, page: Int) throws -> ListPullRequest? {
        self.callsToAvailablePullRequestsSummary += 1

        return ListPullRequest.validListPullRequest
    }
}
