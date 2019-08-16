//
//  PullRequestSummaryViewControllerNavigationBehavior.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

extension PullRequestSummaryViewController: NavigableForSafariViewController {
    func showAlert(withMessage message: String) {
        let destination = AlertMessageDestination(title: "Desculpe... :(",
                                                  message: message,
                                                  buttonTitle: "Ok")

        self.present(destination.viewController,
                     animated: true,
                     completion: nil)
    }

    func openSafariViewController(with urlString: String) {
        let destination = SafariViewControllerDestination(urlString: urlString)

        self.present(destination.viewController,
                     animated: true,
                     completion: nil)
    }
}
