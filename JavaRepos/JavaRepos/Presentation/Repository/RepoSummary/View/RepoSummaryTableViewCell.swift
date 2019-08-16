//
//  RepoSummaryTableViewCell.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class RepoSummaryTableViewCell: UITableViewCell, IdentifiableCell {
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var repoNumberOfForksLabel: UILabel!
    @IBOutlet weak var repoNumberOfStarsLabel: UILabel!
    @IBOutlet weak var repoOwnerPhotoImage: UIImageView!
    @IBOutlet weak var repoOwnerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.configureBorderImage()
    }

    private func configureBorderImage() {
        self.repoOwnerPhotoImage.circularRadius()
    }

    func set(_ repository: Repository) {
        self.repoNameLabel.text = repository.name
        self.repoDescriptionLabel.text = repository.description
        self.repoNumberOfForksLabel.text = String(format: "%d", repository.forksCount)
        self.repoNumberOfStarsLabel.text = String(format: "%d", repository.stargazersCount)

        self.set(repository.owner)
    }

    private func set(_ owner: RepoOwner) {
        self.repoOwnerNameLabel.text = owner.name
        self.repoOwnerPhotoImage.downloadImage(withURL: owner.urlImage,
                                               placeholder: "ic_profile_placeholder")
    }
}
