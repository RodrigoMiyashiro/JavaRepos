//
//  PullRequestSummaryShowScreen.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol PullRequestSummaryShowScreen: AnyObject {
    func displayableListPullRequest(_ listPullRequest: ListPullRequest)

    func showErrorObtainingListPullRequestSummary()
}
