//
//  Navigator.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

protocol Navigator {
    func navigate(to destination: Destination, mode: NavigationMode)
    func navigate(to destination: Destination, mode: NavigationMode, effect: NavigationEffect)
    func set(current: UIViewController)
}
