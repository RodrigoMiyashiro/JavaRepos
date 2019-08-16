//
//  ListPullRequestTestData.swift
//  JavaReposTests
//
//  Created by Rodrigo Miyashiro on 12/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension ListPullRequest {
    static var validListPullRequest: ListPullRequest {
        let parser = ParseForMock()
        let listPullRequest: ListPullRequest? = parser.parseData(fileName: "PullRequestFromARepository",
                                                                ofType: "json")

        return listPullRequest!
    }
}
