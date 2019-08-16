//
//  ViewControllerNavigationBehavior.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIViewController {
    var navigator: Navigator? {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)?.navigator
        }
    }
}
