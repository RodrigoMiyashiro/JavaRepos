//
//  RepoSummaryDestination.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class RepoSummaryDestination: Destination {
    private var createdViewController: UIViewController?

    var viewController: UIViewController {
        get {
            if let existingViewController = self.createdViewController {
                return existingViewController
            }

            let destination = self.destinationBuilder()
            let screen = destination.viewController

            return screen
        }
    }
}
