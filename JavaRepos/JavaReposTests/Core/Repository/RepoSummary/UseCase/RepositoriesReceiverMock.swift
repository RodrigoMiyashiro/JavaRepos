//
//  RepositoriesReceiverMock.swift
//  JavaReposTests
//
//  Created by Rodrigo Miyashiro on 12/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class RepositoriesReceiverMock: RepositoriesReceiver {
    var callsToReceiverRepositoriesSummary = 0
    var callsToHandleErrorObtainingRepositoriesSummary = 0

    var obtainRepositories: ListRepositories?

    func receiveRepositories(_ repositories: ListRepositories?) {
        self.callsToReceiverRepositoriesSummary += 1

        self.obtainRepositories = repositories
    }

    func handleErrorObtainingRepositories() {
        self.callsToHandleErrorObtainingRepositoriesSummary += 1
    }
}
