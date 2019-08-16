//
//  TableViewForPullRequestSummary.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

private let numberOfSectionsForListRepositories: Int = 1
private let zeroRepositoriesItems: Int = 0

class TableViewForPullRequestSummary: NSObject, UITableViewDataSource, UITableViewDelegate {
    var listPullRequest: ListPullRequest?
    var delegateForSafariViewController: NavigableForSafariViewController?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSectionsForListRepositories
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pullRequests = self.listPullRequest?.pullRequests else {
            return zeroRepositoriesItems
        }
        
        return pullRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = PullRequestSummaryTableViewCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? PullRequestSummaryTableViewCell else {
                                                        return UITableViewCell()
        }
        
        let row = indexPath.row
        if let pullRequests = self.listPullRequest?.pullRequests {
            let pullRequest = pullRequests[row]
            cell.set(pullRequest)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let row = indexPath.row

        guard let list = self.listPullRequest else {
            return
        }
        
        guard let pullRequest = list.pullRequests?[row] else {
            return
        }

        self.delegateForSafariViewController?.openSafariViewController(with: pullRequest.url)
    }
}
