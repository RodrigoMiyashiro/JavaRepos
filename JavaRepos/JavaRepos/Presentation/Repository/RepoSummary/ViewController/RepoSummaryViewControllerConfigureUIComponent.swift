//
//  RepoSummaryViewControllerConfigureUIComponent.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension RepoSummaryViewController {
    internal func configureTableView() {
        self.dataSourceDelegateForRepoSummaryTableView.delegateForPullRequests = self

        self.repoTableView.dataSource = self.dataSourceDelegateForRepoSummaryTableView
        self.repoTableView.delegate = self.dataSourceDelegateForRepoSummaryTableView
        self.repoTableView.tableFooterView = UIView()
    }

    internal func configureRefreshControl() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self,
                                       action: #selector(self.refresh(_:)),
                                       for: .valueChanged)

        guard  let refreshControl = self.refreshControl else {
            return
        }

        self.repoTableView.addSubview(refreshControl)
    }
}
