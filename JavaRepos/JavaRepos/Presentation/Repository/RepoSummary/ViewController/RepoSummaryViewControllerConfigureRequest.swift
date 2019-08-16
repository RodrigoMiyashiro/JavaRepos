//
//  RepoSummaryViewControllerConfigureRequest.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIScrollView_InfiniteScroll

private let firstPage: Int = 1
private let incrementOnePage: Int = 1

extension RepoSummaryViewController {
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
        let executor = DefaultRepositoriesSummaryExecutor()

        self.presenter = RepoSummaryPresenter(screen: self, executor: executor)
        self.presenter?.retrieveListRepositoriesSummary(page: self.currentPage)

        self.currentPage += incrementOnePage
    }

    internal func configureInfiniteScroll() {
        self.repoTableView.addInfiniteScroll { (tableView) in
            tableView.performBatchUpdates({
                self.wasCalledInfiniteScroll = true
                self.startRequest()
            }, completion: { _ in
                tableView.finishInfiniteScroll()
            })
        }
    }
}
