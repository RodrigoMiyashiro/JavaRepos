//
//  DefaultPullRequestSummaryProvider.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 13/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class DefaultPullRequestSummaryProvider: PullRequestsProvider, RemoteProvider {
    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func pullRequests(ownerName: String, repositoryName: String, page: Int) throws -> ListPullRequest? {
        let path = "/repos/\(ownerName)/\(repositoryName)/pulls"
        let url = self.baseRemoteAddress().appendedPath(path)
        let parameters = ["state": "all",
                          "page": "\(page)"]

        guard let listPullRequests: ListPullRequest = try self.client.request(url,
                                                                              httpMethod: .get,
                                                                              queryParamenters: parameters,
                                                                              headerParamenters: nil,
                                                                              bodyParamenters: nil) else {
            throw PullRequestsProviderError.errorObtainingPullRequests
        }

        return listPullRequests
    }
}
