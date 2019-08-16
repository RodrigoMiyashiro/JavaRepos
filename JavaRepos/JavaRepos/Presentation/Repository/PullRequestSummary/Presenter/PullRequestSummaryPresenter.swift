//
//  PullRequestSummaryPresenter.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class PullRequestSummaryPresenter {
    unowned let screen: PullRequestSummaryShowScreen
    unowned let executor: ObtainPullRequestsSummaryExecutor

    init(screen: PullRequestSummaryShowScreen, executor: ObtainPullRequestsSummaryExecutor) {
        self.screen = screen
        self.executor = executor
    }

    func retrieveListPullRequestSummary(_ ownerName: String, repositoryName: String, page: Int) {
        self.executor.obtainPullRequestsSummary(ownerName,
                                                repositoryName: repositoryName,
                                                page: page) { (listPullRequest, error) in
            if error != nil {
                self.screen.showErrorObtainingListPullRequestSummary()
                return
            }

            guard let pullRequests = listPullRequest else {
                self.screen.showErrorObtainingListPullRequestSummary()
                return
            }

            self.screen.displayableListPullRequest(pullRequests)
        }
    }
}
