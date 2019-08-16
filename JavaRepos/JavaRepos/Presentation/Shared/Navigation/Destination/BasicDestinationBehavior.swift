//
//  BasicDestinationBehavior.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension Destination {
    func initialViewController(ofStoryboard storyboardName: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            return UIViewController()
        }

        return initialViewController
    }
}
