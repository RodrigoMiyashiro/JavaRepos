//
//  DefaultRepoSummaryProvider.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 13/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class DefaultRepoSummaryProvider: RepositoriesProvider, RemoteProvider {
    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func repositories(page: Int) throws -> ListRepositories? {
        let path = "/search/repositories"
        let url = self.baseRemoteAddress().appendedPath(path)
        let parameters = ["q": "language:java",
                          "sort": "stars",
                          "page": "\(page)",
                          "per_page": "\(20)"]

        guard let listRepositories: ListRepositories = try self.client.request(url,
                                                                               httpMethod: .get,
                                                                               queryParamenters: parameters,
                                                                               headerParamenters: nil,
                                                                               bodyParamenters: nil) else {
            throw RepositoriesProviderError.errorObtainingRepositories
        }

        return listRepositories
    }
}
