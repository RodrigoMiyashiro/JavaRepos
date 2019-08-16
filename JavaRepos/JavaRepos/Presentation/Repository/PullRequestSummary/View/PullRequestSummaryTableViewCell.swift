//
//  PullRequestSummaryTableViewCell.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class PullRequestSummaryTableViewCell: UITableViewCell, IdentifiableCell {
    @IBOutlet weak var pullRequestNameLabel: UILabel!
    @IBOutlet weak var pullRequestDescriptionLabel: UILabel!
    @IBOutlet weak var pullRequestStatusLabel: UILabel!
    @IBOutlet weak var pullRequestCreatedAtLabel: UILabel!
    @IBOutlet weak var pullRequestOwnerPhotoImage: UIImageView!
    @IBOutlet weak var pullRequestOwnerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.configureBorderImage()
    }

    private func configureBorderImage() {
        self.pullRequestOwnerPhotoImage.circularRadius()
    }

    func set(_ pullRequest: PullRequest) {
        self.pullRequestNameLabel.text = pullRequest.title
        self.pullRequestDescriptionLabel.text = pullRequest.body
        self.pullRequestStatusLabel.text = pullRequest.state
        self.pullRequestCreatedAtLabel.text = String(format: "Criado\n%@", pullRequest.createdAt.formatDate)

        let owner = pullRequest.user
        self.set(owner)
    }

    func set(_ owner: RepoOwner) {
        self.pullRequestOwnerNameLabel.text = owner.name
        self.pullRequestOwnerPhotoImage.downloadImage(withURL: owner.urlImage,
                                                      placeholder: "ic_profile_placeholder")
    }
}
