//
//  ObtainPullRequestsTest.swift
//  JavaReposTests
//
//  Created by Rodrigo Miyashiro on 12/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import XCTest

class ObtainPullRequestsTest: XCTestCase {
    var receiver: PullRequestsReceiverMock?

    override func setUp() {
        super.setUp()

        self.receiver = PullRequestsReceiverMock()
    }

    override func tearDown() {
        self.receiver = nil

        super.tearDown()
    }

    func testObtainListPullRequestsSummarySuccessfull() {
        let ownerName: String = "Fulano"
        let repositoryName: String = "repository0123"
        let firstPage: Int = 1
        let providerMock = PullRequestsProviderMock()
        let obtainListPullRequestsSummary = ObtainPullRequests(provider: providerMock,
                                                               receiver: self.receiver!)

        obtainListPullRequestsSummary.execute(with: (ownerName, repositoryName, firstPage))

        XCTAssert(providerMock.callsToAvailablePullRequestsSummary == 1,
                  "There should be at least 1 call to provider's available obtain pull requests summary.")
        XCTAssert(self.receiver?.callsToReceiverPullRequestsSummary == 1,
                  "There should be at least 1 call to receiver's main method - Successfully.")
    }

    func testObtainListPullRequestsSummaryFailure() {
        let ownerName: String = "Fulano"
        let repositoryName: String = "repository0123"
        let firstPage: Int = 1
        let providerMock = PullRequestsProviderMockFailure()
        let obtainListPullRequestsSummary = ObtainPullRequests(provider: providerMock,
                                                               receiver: self.receiver!)

        obtainListPullRequestsSummary.execute(with: (ownerName, repositoryName, firstPage))

        XCTAssert(providerMock.callsToAvailablePullRequestsSummary == 1,
                  "There should be at least 1 call to provider's available obtain pull requests summary.")
        XCTAssert(self.receiver?.callsToHandleErrorObtainingPullRequests == 1,
                  "There should be at least 1 call to receiver's main method - Failure.")
    }
}
