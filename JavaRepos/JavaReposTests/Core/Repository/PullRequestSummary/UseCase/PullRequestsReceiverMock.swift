//
//  PullRequestsReceiverMock.swift
//  JavaReposTests
//
//  Created by Rodrigo Miyashiro on 12/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class PullRequestsReceiverMock: PullRequestsReceiver {
    var callsToReceiverPullRequestsSummary = 0
    var callsToHandleErrorObtainingPullRequestsSummary = 0

    var obtainPullRequests: ListPullRequest?

    func receiverPullRequests(_ pullRequests: ListPullRequest?) {
        self.callsToReceiverPullRequestsSummary += 1

        self.obtainPullRequests = pullRequests
    }

    func handleErrorObtainingPullRequests() {
        self.callsToHandleErrorObtainingPullRequestsSummary += 1
    }
}
