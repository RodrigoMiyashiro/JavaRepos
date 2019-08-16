//
//  RepoSummaryPresenter.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class RepoSummaryPresenter {
    unowned let screen: RepoSummaryShowScreen
    unowned let executor: ObtainRepositoriesSummaryExecutor

    init(screen: RepoSummaryShowScreen, executor: ObtainRepositoriesSummaryExecutor) {
        self.screen = screen
        self.executor = executor
    }

    func retrieveListRepositoriesSummary(page: Int) {
        self.executor.obtainRepositoriesSummary(page) { (listRepositories, error) in
            if error != nil {
                self.screen.showErrorObtainingListRepositoriesSummary()
                return
            }

            guard let repositories = listRepositories else {
                self.screen.showErrorObtainingListRepositoriesSummary()
                return
            }

            self.screen.displayableListRepositories(repositories)
        }
    }
}
