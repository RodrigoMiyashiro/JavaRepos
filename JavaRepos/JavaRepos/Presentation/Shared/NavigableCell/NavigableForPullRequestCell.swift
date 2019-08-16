//
//  NavigableForPullRequestCell.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol NavigableForPullRequestCell {
    func openNextView(with ownerName: String, and repoName: String)
}
