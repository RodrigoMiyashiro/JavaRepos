//
//  RepoSummaryViewControllerNavigationBehavior.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

extension RepoSummaryViewController: NavigableForPullRequestCell {
    func showAlert(withMessage message: String) {
        let destination = AlertMessageDestination(title: "Desculpe... :(",
                                                  message: message,
                                                  buttonTitle: "Ok")

        self.navigator?.navigate(to: destination,
                                 mode: .fromCurrent)
    }

    func openNextView(with ownerName: String, and repoName: String) {
        let destination = PullRequestSummaryDestination(ownerName: ownerName,
                                                        repoName: repoName)
        self.navigator?.set(current: self)
        self.navigator?.navigate(to: destination,
                                 mode: .fromCurrent)
    }
}
