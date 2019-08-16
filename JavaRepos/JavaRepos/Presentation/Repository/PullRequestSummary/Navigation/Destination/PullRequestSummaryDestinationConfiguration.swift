//
//  PullRequestSummaryDestinationConfiguration.swift
//  JavaRepos
//
//  Created by Rodrigo Miyashiro on 14/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

extension PullRequestSummaryDestination {
    func destinationBuilder() -> Destination {
        return PullRequestSummaryTypeDestination()
    }
}
