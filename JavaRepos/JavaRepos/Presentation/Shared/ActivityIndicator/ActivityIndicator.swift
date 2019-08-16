//
//  ActivityIndicator.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ActivityIndicator: UIView {
    lazy var spinner: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.center = self.center
        return activityIndicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.configurationBackgroundView()
        self.configurationActivityIndicator()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurationBackgroundView() {
        let color = UIColor.lightGray
        let alphaValue: CGFloat = 0.8

        self.backgroundColor = color.withAlphaComponent(alphaValue)
    }

    private func configurationActivityIndicator() {
        self.addSubview(self.spinner)
        self.spinner.startAnimating()
    }
}
