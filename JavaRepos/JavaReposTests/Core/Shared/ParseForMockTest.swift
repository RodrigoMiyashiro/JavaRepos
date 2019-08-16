//
//  ParseForMockTest.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 11/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import XCTest

class ParseForMockTest: XCTestCase {
    private var parseForMock: ParseForMock?

    override func setUp() {
        super.setUp()

        self.parseForMock = ParseForMock()
    }

    override func tearDown() {
        self.parseForMock = nil

        super.tearDown()
    }

    func testObtainListRepositoriesSummaryForMock() {
        let repositories: ListRepositories? = self.parseForMock?.parseData(fileName: "ListRepositoriesTest",
                                                                           ofType: "json")

        XCTAssert(repositories != nil, "It's a ListRepositories.")
    }

    func testObtainPullRequestFromARepositoryForMock() {
        let pullRequests: ListPullRequest? = self.parseForMock?.parseData(fileName: "PullRequestFromARepository",
                                                                          ofType: "json")

        XCTAssert(pullRequests != nil, "It's a ListPullRequest")
    }
}
