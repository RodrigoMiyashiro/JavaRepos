//
//  PullRequestSummaryDestination.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class PullRequestSummaryDestination: Destination {
    private let repoName: String?
    private let ownerName: String?
    private var createdViewController: UIViewController?

    var viewController: UIViewController {
            if let existingViewController = self.createdViewController {
                return existingViewController
            }

            let destination = self.destinationBuilder()
            var screen = destination.viewController as! PullRequestSummaryDestinationScreen
            screen.ownerName = self.ownerName
            screen.repoName = self.repoName

            return screen as! UIViewController
    }

    init(ownerName: String, repoName: String) {
        self.repoName = repoName
        self.ownerName = ownerName
    }
}
