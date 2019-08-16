//
//  ObtainPullRequestsSummaruExecutor.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 13/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol ObtainPullRequestsSummaryExecutor: AnyObject {
    func obtainPullRequestsSummary(_ ownerName: String, repositoryName: String, page: Int, completion: @escaping(ListPullRequest?, Error?) -> Void)
}
