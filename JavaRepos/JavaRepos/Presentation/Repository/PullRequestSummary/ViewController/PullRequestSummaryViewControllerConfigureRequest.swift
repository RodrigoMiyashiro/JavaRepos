//
//  PullRequestSummaryViewControllerConfigureRequest.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIScrollView_InfiniteScroll

private let firstPage: Int = 1
private let incrementOnePage: Int = 1

extension PullRequestSummaryViewController {
    internal func initialRequest() {
        self.startActivityIndicator()
        self.startInitialPage()
    }

    @objc internal func refresh(_ sender: AnyObject) {
        startInitialPage()
    }

    private func startInitialPage() {
        self.wasCalledInfiniteScroll = false
        self.currentPage = firstPage
        self.startRequest()
    }

    internal func startRequest() {
        guard let ownerName = self.ownerName, let repoName = self.repoName else {
            return
        }

        let executor = DefaultPullRequestsSummaryExecutor()

        self.presenter = PullRequestSummaryPresenter(screen: self,
                                                     executor: executor)
        self.presenter?.retrieveListPullRequestSummary(ownerName,
                                                       repositoryName: repoName,
                                                       page: self.currentPage)

        self.currentPage += incrementOnePage
    }

    internal func configureInfiniteScroll() {
        self.pullRequestTableView.addInfiniteScroll { (tableView) in
            tableView.performBatchUpdates({
                self.wasCalledInfiniteScroll = true
                self.startRequest()
            }, completion: { _ in
                tableView.finishInfiniteScroll()
            })
        }
    }
}
