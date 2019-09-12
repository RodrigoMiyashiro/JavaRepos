//
//  ObtainRepositoriesTest.swift
//  JavaReposTests
//
//  Created by Rodrigo Miyashiro on 12/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import XCTest

class ObtainRepositoriesTest: XCTestCase {
    var receiver: RepositoriesReceiverMock?

    override func setUp() {
        super.setUp()

        self.receiver = RepositoriesReceiverMock()
    }

    override func tearDown() {
        self.receiver = nil

        super.tearDown()
    }

    func testObtainListRepositoriesSummarySuccessfully() {
        let page: Int = 1
        let providerMock = RepositoriesProviderMock()
        let obtainListRepositoriesSummary = ObtainRepositories(provider: providerMock,
                                                               receiver: self.receiver!)

        obtainListRepositoriesSummary.execute(with: page)

        XCTAssert(providerMock.callsToAvailableRepositoriesSummary == 1,
                  "There should be at least 1 call to provider's available obtain repositories summary.")
        XCTAssert(self.receiver?.callsToReceiverRepositoriesSummary == 1,
                  "There should be at least 1 call to receiver's main method - Successfully.")
    }

    func testObtainListRepositoriesSummaryFailure() {
        let page: Int = 1
        let providerMock = RepositoriesProviderMockFailure()
        let obtainListRepositoriesSummary = ObtainRepositories(provider: providerMock,
                                                               receiver: self.receiver!)

        obtainListRepositoriesSummary.execute(with: page)

        XCTAssert(providerMock.callsToAvailableRepositoriesSummary == 1,
                  "There should be at least 1 call to provider's available obtain repositories summary.")
        XCTAssert(self.receiver?.callsToHandleErrorObtainingRepositories == 1,
                  "There should be at least 1 call to receiver's main method - Failure.")
    }
}
