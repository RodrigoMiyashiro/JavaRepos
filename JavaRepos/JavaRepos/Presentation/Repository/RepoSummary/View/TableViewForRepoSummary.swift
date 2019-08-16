//
//  TableViewForRepoSummary.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

private let numberOfSectionsForListRepositories: Int = 1
private let zeroRepositoriesItems: Int = 0

class TableViewForCarRepairSummary: NSObject, UITableViewDataSource, UITableViewDelegate {
    var listRepositories: ListRepositories?
    var delegateForPullRequests: NavigableForPullRequestCell?

    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSectionsForListRepositories
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let repositories = self.listRepositories?.repositories else {
            return zeroRepositoriesItems
        }

        return repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = RepoSummaryTableViewCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? RepoSummaryTableViewCell else {
            return UITableViewCell()
        }

        let row = indexPath.row
        if let repositories = self.listRepositories?.repositories {
            let repository = repositories[row]
            cell.set(repository)
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

        guard let repository = self.listRepositories?.repositories[row] else {
            return
        }

        let owner = repository.owner
        let ownerName = owner.name
        let repoName = repository.name

        self.delegateForPullRequests?.openNextView(with: ownerName, and: repoName)
    }
}
