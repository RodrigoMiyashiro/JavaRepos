//
//  PullRequestSummaryViewControllerConfigureUIComponents.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension PullRequestSummaryViewController {
    internal func configureTableView() {
        self.dataSourceDelegateForPullRequestSummaryTableView.delegateForSafariViewController = self

        self.pullRequestTableView.dataSource = self.dataSourceDelegateForPullRequestSummaryTableView
        self.pullRequestTableView.delegate = self.dataSourceDelegateForPullRequestSummaryTableView
        self.pullRequestTableView.tableFooterView = UIView()
    }

    internal func configureRefreshControl() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self,
                                       action: #selector(self.refresh(_:)),
                                       for: .valueChanged)

        guard  let refreshControl = self.refreshControl else {
            return
        }

        self.pullRequestTableView.addSubview(refreshControl)
    }
}
