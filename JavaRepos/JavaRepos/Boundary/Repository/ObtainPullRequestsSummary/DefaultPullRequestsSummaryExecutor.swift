//
//  DefaultPullRequestsSummaryExecutor.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 13/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultPullRequestsSummaryExecutor: ObtainPullRequestsSummaryExecutor, PullRequestsReceiver {
    private var isSuccess = false
    private var obtainPullRequests: ListPullRequest?

    func obtainPullRequestsSummary(_ ownerName: String,
                                   repositoryName: String,
                                   page: Int,
                                   completion: @escaping (ListPullRequest?, Error?) -> Void) {
        let clientHTTP = DefaultHTTPClient()
        let provider = DefaultPullRequestSummaryProvider(client: clientHTTP)
        let obtainPullRequestsSummary = ObtainPullRequests(provider: provider,
                                                           receiver: self)

        DispatchQueue.global().async {
            obtainPullRequestsSummary.execute(with: (ownerName, repositoryName, page))

            DispatchQueue.main.async {
                if let obtainedPullRequestsSummary = self.obtainPullRequests, self.isSuccess {
                    completion(obtainedPullRequestsSummary, nil)
                } else {
                    completion(nil, ObtainPullRequestsSummaryExecutorError.errorObtainingPullRequestsSummary)
                }
            }
        }
    }

    func receiverPullRequests(_ pullRequests: ListPullRequest?) {
        self.obtainPullRequests = pullRequests

        self.isSuccess = true
    }

    func handleErrorObtainingPullRequests() {
        self.isSuccess = false
    }
}
