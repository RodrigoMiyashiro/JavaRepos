//
//  PullRequestsReceiver.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol PullRequestsReceiver: AnyObject {
    func receiverPullRequests(_ pullRequests: ListPullRequest?)

    func handleErrorObtainingPullRequests()
}
