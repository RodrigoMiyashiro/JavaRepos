//
//  RepositoriesProviderMockFailure.swift
//  JavaReposTests
//
//  Created by Rodrigo Miyashiro on 12/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class RepositoriesProviderMockFailure: RepositoriesProvider {
    var callsToAvailableRepositoriesSummary = 0

    func repositories(page: Int) throws -> ListRepositories? {
        self.callsToAvailableRepositoriesSummary += 1

        throw RepositoriesProviderError.errorObtainingRepositories
    }
}
