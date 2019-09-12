//
//  PullRequestSummaryTypeDestination.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class PullRequestSummaryTypeDestination: Destination {
    var viewController: UIViewController {
        return self.initialViewController(ofStoryboard: "PullRequestSummaryStoryboard")
    }
}
