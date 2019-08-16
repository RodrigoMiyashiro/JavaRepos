//
//  DefaultRepositoriesSummaryExecutor.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 13/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultRepositoriesSummaryExecutor: ObtainRepositoriesSummaryExecutor, RepositoriesReceiver {
    private var isSuccess = false
    private var obtainListRepositories: ListRepositories?

    func obtainRepositoriesSummary(_ page: Int, completion: @escaping (ListRepositories?, Error?) -> Void) {
        let clientHTTP = DefaultHTTPClient()
        let provider = DefaultRepoSummaryProvider(client: clientHTTP)
        let obtainRepositoriesSummary = ObtainRepositories(provider: provider,
                                                           receiver: self)

        DispatchQueue.global().async {
            obtainRepositoriesSummary.execute(with: page)

            DispatchQueue.main.async {
                if let obtainedRepositoriesSummary = self.obtainListRepositories, self.isSuccess {
                    completion(obtainedRepositoriesSummary, nil)
                } else {
                    completion(nil, ObtainRepositoriesSummaryExecutorError.errorObtainingRepositoriesSummary)
                }
            }
        }
    }

    func receiveRepositories(_ repositories: ListRepositories?) {
        self.obtainListRepositories = repositories

        self.isSuccess = true
    }

    func handleErrorObtainingRepositories() {
        self.isSuccess = false
    }
}
